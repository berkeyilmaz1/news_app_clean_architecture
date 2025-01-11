/// This file defines the base UseCase class which will be used by all use cases in the application.
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
