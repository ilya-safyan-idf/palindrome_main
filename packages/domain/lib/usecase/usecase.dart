abstract class Usecase<Params, Output> {
  Output call({required Params params});
  void dispose();
}
