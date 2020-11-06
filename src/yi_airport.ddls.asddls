@AbapCatalog.sqlViewName: 'YIAIRPORT_RE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Airport CDS view'
define view YI_AIRPORT
  as select from /dmo/airport as Airport
{
  key airport_id as AirportId,
      @Semantics.text: true
      name       as Name,
      city       as City,
      country    as Country
}
