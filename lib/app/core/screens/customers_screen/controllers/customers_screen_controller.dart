import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomersScreenController extends FullLifeCycleController with FullLifeCycleMixin {
  static const _pageSize = 10;


  final PagingController<int, DocumentSnapshot> pagingController =
  PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();

  }


  Future<void> _fetchPage(int pageKey) async {
    try {
      QuerySnapshot querySnapshot;

      if (pageKey == 0) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('clients')
            .orderBy('name')
            .limit(_pageSize)
            .get();
      } else {
        final lastDocument = pagingController.itemList?.last;
        if (lastDocument != null) {
          querySnapshot = await FirebaseFirestore.instance
              .collection('clients')
              .orderBy('name')
              .startAfterDocument(lastDocument)
              .limit(_pageSize)
              .get();
        } else {
          throw Exception('Last document is null');
        }
      }

      final isLastPage = querySnapshot.docs.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(querySnapshot.docs);
      } else {
        final nextPageKey = pageKey + querySnapshot.docs.length;
        pagingController.appendPage(querySnapshot.docs, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  void onDetached() {
    // Handle onDetached
  }

  @override
  void onHidden() {
    // Handle onHidden
  }

  @override
  void onInactive() {
    // Handle onInactive
  }

  @override
  void onPaused() {
    // Handle onPaused
  }

  @override
  void onResumed() {
    // Handle onResumed
  }
}
