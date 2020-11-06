@AbapCatalog.sqlViewName: 'YIFLIGHT_R'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight cds view'
define view YI_FLIGHT_R
  as select from /dmo/flight as Flight
  association [1] to YI_CARRIER as _Airline on $projection.AirlineID = _Airline.CarrierID
{
  @ObjectModel.text.association: '_Airline'
  key carrier_id     as AirlineID,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      @Semantics.currencyCode: true
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneType,
      seats_max      as MaximumSeats,
      seats_occupied as OccupiedSeats,

      //      Association
      _Airline
}
