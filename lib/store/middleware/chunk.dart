import 'package:redux/redux.dart';

dynamic thunkMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is ThunkAction<State>) {
    return action(store);
  } else if (action is CallableThunkAction<State>) {
    return action.call(store);
  } else {
    return next(action);
  }
}

class ExtraArgumentThunkMiddleware<S, A> extends MiddlewareClass<S> {
  final A extraArgument;

  ExtraArgumentThunkMiddleware(this.extraArgument);

  @override
  dynamic call(Store<S> store, dynamic action, NextDispatcher next) {
    if (action is ThunkActionWithExtraArgument<S, A>) {
      return action(store, extraArgument);
    } else if (action is CallableThunkActionWithExtraArgument<S, A>) {
      return action.call(store, extraArgument);
    } else {
      return next(action);
    }
  }
}

typedef dynamic ThunkAction<State>(Store<State> store);

abstract class CallableThunkAction<State> {
  dynamic call(Store<State> store);
}

typedef dynamic ThunkActionWithExtraArgument<S, A>(
  Store<S> store,
  A extraArgument,
);

abstract class CallableThunkActionWithExtraArgument<S, A> {
  dynamic call(Store<S> store, A extraArgument);
}
