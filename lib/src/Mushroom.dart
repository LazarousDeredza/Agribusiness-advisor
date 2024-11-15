import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class Mushroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       appBar: AppBar(
        title: Text(
          'Mushroom Cultivation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(

        children: [
          // Banner Image
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mushroom.png'),
                fit: BoxFit.scaleDown,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          // Document List
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                SizedBox(height: 20),
                _buildDocumentItem(
                  context,
                  'Mushroom Production',
                  'assets/documents/mushroom.pdf',
                ),
                _buildDocumentItem(
                  context,
                  'Improved Low-Cost Indoor Oyster Mushroom Production',
                  'assets/documents/IMPROVED LOW-COST INDOOR OYSTER MUSHROOM PRODUCTION_20240815_132736_0000.pdf',
                ),
                SizedBox(height: 20),
                Text(
                  'Mushroom Images',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                SizedBox(height: 10),
                _buildImageGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildDocumentItem(BuildContext context, String title, String pdfPath) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 5.0,
    child: InkWell(
      onTap: () async {
        String path = await fromAsset(pdfPath, pdfPath.split('/').last);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewerScreen(pdfPath: path),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.picture_as_pdf,
              color: Colors.green.shade700,
              size: 40,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildImageGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        String imagePath = 'assets/mushroom/${index + 1}.jpg';
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(imagePath: imagePath),
              ),
            );
          },
          child: Hero(
            tag: imagePath,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String> fromAsset(String asset, String filename) async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      return file.path;
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
  }
}

class PdfViewerScreen extends StatefulWidget {
  final String pdfPath;

  const PdfViewerScreen({required this.pdfPath});

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen>
    with WidgetsBindingObserver {
  late PDFViewController _pdfViewController;
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Document View',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              if (currentPage! > 0) {
                _pdfViewController.setPage(currentPage! - 1);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              if (currentPage! < pages! - 1) {
                _pdfViewController.setPage(currentPage! + 1);
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.pdfPath,
            autoSpacing: true,
            enableSwipe: true,
            fitPolicy: FitPolicy.BOTH,
            fitEachPage: true,
            swipeHorizontal: false,
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
            },
            onViewCreated: (PDFViewController pdfViewController) {
              setState(() {
                _pdfViewController = pdfViewController;
              });
            },
            onPageChanged: (int? page, int? total) {
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(child: CircularProgressIndicator())
                  : Container()
              : Center(child: Text(errorMessage)),
        ],
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: imagePath,
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
