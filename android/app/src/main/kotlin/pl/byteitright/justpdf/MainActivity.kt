package pl.byteitright.justpdf

import android.content.ContentResolver
import android.content.Intent
import android.database.Cursor
import android.net.Uri
import android.provider.OpenableColumns
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
     private val channel = "pdf_opener_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            when (call.method) {
                "getPdfDetails" -> {
                    val intent: Intent = intent
                    val data: Uri? = intent.data
                    if (data != null) {
                        val details = getFileNameAndSize(data)
                        if (details != null) {
                            result.success(details)
                        } else {
                            result.error("UNAVAILABLE", "File details not available", null)
                        }
                    } else {
                        result.error("UNAVAILABLE", "PDF path not available", null)
                    }
                }
                "getFileBytesFromUri" -> {
                    val uriString = call.argument<String>("uri")
                    if (uriString != null) {
                        val uri = Uri.parse(uriString)
                        val fileBytes = getFileBytes(uri)
                        if (fileBytes != null) {
                            result.success(fileBytes)
                        } else {
                            result.error("UNAVAILABLE", "File could not be read", null)
                        }
                    } else {
                        result.error("INVALID_ARGUMENT", "URI is null", null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getFileNameAndSize(uri: Uri): List<String>? {
        val projection = arrayOf(OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE)
        val contentResolver: ContentResolver = contentResolver
        val cursor: Cursor? = contentResolver.query(uri, projection, null, null, null)
        return if (cursor != null && cursor.moveToFirst()) {
            val fileName = cursor.getString(cursor.getColumnIndexOrThrow(OpenableColumns.DISPLAY_NAME))
            val fileSize = cursor.getLong(cursor.getColumnIndexOrThrow(OpenableColumns.SIZE))
            cursor.close()
            listOf(uri.toString(), fileName, fileSize.toString())
        } else {
            null
        }
    }

    private fun getFileBytes(uri: Uri): ByteArray? {
        return try {
            val inputStream = contentResolver.openInputStream(uri)
            inputStream?.readBytes()
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
}
