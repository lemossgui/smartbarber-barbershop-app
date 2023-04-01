import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

enum HomeStreams {
  barbershop,
}

class HomeBloC extends BloC<HomeEvent> {
  static const route = '/home';

  final BarbershopRepository barbershopRepository;

  HomeBloC({
    required this.barbershopRepository,
  });

  @override
  void onInit() async {
    await _loadBarbershop();
    super.onInit();
  }

  Future<void> _loadBarbershop() async {
    await handleListing(
      action: () async {
        final result = await barbershopRepository.findById(1);
        result.map(_handleBarbershopFindByIdSuccess).mapError(handleFailure);
      },
    );
  }

  void _handleBarbershopFindByIdSuccess(BarbershopModel model) {
    dispatch(model, key: HomeStreams.barbershop);
  }

  @override
  void handleEvent(HomeEvent event) {
    if (event is NavigateToBarbershopProfile) {
      _navigateToBarbershopProfile();
    }
  }

  void _navigateToBarbershopProfile() {
    toNamed(BarbershopProfileBloC.route);
  }
}
