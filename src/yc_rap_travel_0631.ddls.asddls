@EndUserText.label: 'Travel BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity YC_RAP_TRAVEL_0631
  as projection on YI_RAP_TRAVEL_0631 as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Agency', entity.element: 'AgencyID' }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyID,
      _Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Customer', entity.element: 'CustomerID' }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity.name: 'I_Currency', entity.element: 'Currency' }]
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Agency,
      @Search.defaultSearchElement: true
      _Booking : redirected to composition child YC_RAP_BOOKING_0631,
      _Currency,
      _Customer
}
