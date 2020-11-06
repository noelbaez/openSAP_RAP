@AbapCatalog.sqlViewName: 'YICONNECT_R'
@AbapCatalog.compiler.compareFilter: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read only E2E: Data model connection'
define view YI_CONNECTION_R
  as select from /dmo/connection as Connection
  association [1..*] to YI_FLIGHT_R as _Flight      on  $projection.AirlineId    = _Flight.AirlineID
                                                    and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to YI_CARRIER  as _Airline     on  $projection.AirlineId = _Airline.CarrierID
  association [1]    to YI_AIRPORT  as _AirportFrom on  $projection.DepartureAirport = _AirportFrom.AirportId
  association [1]    to YI_AIRPORT  as _AirportTo   on  $projection.DestinationAirport = _AirportTo.AirportId
{
      @ObjectModel.text.association: '_Airline'
  key Connection.carrier_id      as AirlineId,
  key Connection.connection_id   as ConnectionId,
//      _Airline.Name              as AirlineName,

      @ObjectModel.text.association: '_AirportFrom'
      Connection.airport_from_id as DepartureAirport_o,

      Connection.airport_from_id as DepartureAirport,

      @ObjectModel.text.association: '_AirportTo'
      Connection.airport_to_id   as DestinationAirport_o,
      Connection.airport_to_id   as DestinationAirport,

      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Connection.distance        as Distance,
      @Semantics.unitOfMeasure: true
      Connection.distance_unit   as DistanceUnit,

      //Associations
      _Flight,
      _Airline,
      _AirportFrom,
      _AirportTo
}
