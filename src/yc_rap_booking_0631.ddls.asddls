@EndUserText.label: 'Booking BO Projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity YC_RAP_BOOKING_0631
  as projection on YI_RAP_BOOKING_0631 as Booking
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      @ObjectModel.text.element: ['CarrierName']
      @Consumption.valueHelpDefinition: [{ entity : { name: '/DMO/I_Carrier', element: 'AirlineID' } }]
      @Search.defaultSearchElement: true
      CarrierID,
      _Carrier.Name      as CarrierName,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight', element: 'ConnectionID'},
                        additionalBinding: [{ localElement: 'CarrierID',    element: 'AirlineID'},
                                            { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                            { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT},
                                            { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT} ] } ]
          ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,

      /* Associations */
      _Carrier,
      _Connection,
      _Customer,
      _Flight,
      _Travel : redirected to parent YC_RAP_TRAVEL_0631
}
