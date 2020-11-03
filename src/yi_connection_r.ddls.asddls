@AbapCatalog.sqlViewName: 'YICONNECT_R'
@AbapCatalog.compiler.compareFilter: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read only E2E: Data model connection'
define view YI_CONNECTION_R
  as select from /dmo/connection as Connection 
{
  key Connection.carrier_id      as AirlineId,
  key Connection.connection_id   as ConnectionId,
      Connection.airport_from_id as DepartureAirport,
      Connection.airport_to_id   as DestinationAirport,
      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Connection.distance        as Distance,
      @Semantics.unitOfMeasure: true
      Connection.distance_unit   as DistanceUnit
} 
