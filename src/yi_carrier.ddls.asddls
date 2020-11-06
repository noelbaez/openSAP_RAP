@AbapCatalog.sqlViewName: 'YICARRIER_RE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Carrier CDS view'
@Search.searchable: true
define view YI_CARRIER
  as select from /dmo/carrier as Carrier
{
  key carrier_id    as CarrierID,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      name          as Name,
      @Semantics.currencyCode: true
      currency_code as CurrencyCode
}
