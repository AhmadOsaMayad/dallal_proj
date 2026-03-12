import 'package:flutter/cupertino.dart';

String removeApiApp(String url) {
  try {
    // Parse the URL
    Uri uri = Uri.parse(url);

    // Check if the path contains 'api-app/'
    if (uri.path.contains('api-app/')) {
      // Remove 'api-app/' from the path
      String newPath = uri.path.replaceFirst('api-app/', '');

      // Rebuild the URL with the modified path while preserving all other components
      uri = uri.replace(
        path: newPath,
        query: uri.query, // Preserve query parameters
        fragment: uri.fragment, // Preserve fragment if any
      );

      debugPrint('Original URL: $url');
      debugPrint('Modified URL: ${uri.toString()}');
    }

    return uri.toString();
  } catch (e) {
    // Handle parsing errors (invalid URL)
    debugPrint('Error parsing URL: $e');
    return url; // Return original URL if parsing fails
  }
}
