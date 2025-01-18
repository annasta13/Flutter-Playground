enum ViewState { loading, success, error }

class ViewStateWrapper<T> {
  final ViewState state;
  final T? data;
  final String? errorMessage;

  ViewStateWrapper.loading() : state = ViewState.loading, data = null, errorMessage = null;
  ViewStateWrapper.success(this.data) : state = ViewState.success, errorMessage = null;
  ViewStateWrapper.error(this.errorMessage) : state = ViewState.error, data = null;
}
