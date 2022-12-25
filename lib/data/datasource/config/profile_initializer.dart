import 'package:injectable/injectable.dart';
import 'package:faker/faker.dart';

import 'package:vinyla/data/data.dart';

@injectable
class ProfileInitializer {
  final Faker _faker = Faker(seed: DateTime.now().microsecond);

  ProfileDTO generateProfile() {
    return ProfileDTO(
        login: _faker.internet.userName(),
        firstName: _faker.person.firstName(),
        secondName: _faker.person.lastName(),
        bio: _faker.lorem.sentences(4).join(" "));
  }
}
