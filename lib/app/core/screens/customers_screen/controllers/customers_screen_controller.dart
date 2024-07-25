import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomersScreenController extends FullLifeCycleController with FullLifeCycleMixin {
  static const _pageSize = 10;

  final PagingController<int, DocumentSnapshot> pagingController = PagingController(firstPageKey: 0);
  String _searchQuery = '';

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      QuerySnapshot querySnapshot;
      Query query = FirebaseFirestore.instance.collection('clients').orderBy('name');

      if (_searchQuery.isNotEmpty) {
        query = query.where('name', isGreaterThanOrEqualTo: _searchQuery).where('name', isLessThan: '$_searchQuery\uf8ff');
      }

      if (pageKey == 0) {
        querySnapshot = await query.limit(_pageSize).get();
      } else {
        final lastDocument = pagingController.itemList?.last;
        if (lastDocument != null) {
          querySnapshot = await query.startAfterDocument(lastDocument).limit(_pageSize).get();
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
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
