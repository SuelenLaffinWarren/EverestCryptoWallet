import '../model/market_graphic_view_data.dart';
import '../../shared/api/response/market_graphic_response.dart';

extension MarketMapper on MarketGraphicResponse {
  MarketGraphicViewData toViewMarkerGraphic() {
    return MarketGraphicViewData(
      values: prices,
    );
  }
}
