/// Greeting data used by classic providers and generated providers.
abstract class GreetingRepository {
  String greeting();

  Future<String> fetchMessage();
}

class ApiGreetingRepository implements GreetingRepository {
  ApiGreetingRepository(this.baseUrl);

  final String baseUrl;

  @override
  String greeting() => 'Hello from $baseUrl';

  @override
  Future<String> fetchMessage() async => 'Message from $baseUrl';
}

/// Stand-in used in unit and widget tests. Prefer this over mockito.
class FakeGreetingRepository implements GreetingRepository {
  FakeGreetingRepository({
    this.greetingText = 'fake hello',
    this.message = 'fake async',
  });

  final String greetingText;
  final String message;

  @override
  String greeting() => greetingText;

  @override
  Future<String> fetchMessage() async => message;
}
