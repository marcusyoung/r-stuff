# Simple R function to retrieve postcode using google maps API
# when only the street address is known. Useful, for example, when 
# participants in origin-detination surveys do not provide the
# postcode of their origin or destination. Requires ggmap package.
# Google Maps API daily useage limits apply. 

library("ggmap")

postcodeLookup <- function(address="Buckingham Palace") {
  # get the longitude and latitude of the incomplete address
  getLonlat <- as.numeric(geocode(address))
  # request full address using reverse geocode
  fulladdress <- revgeocode(getLonlat, output="more")
  # convert postal_code from factor to character vector
  postal_code <- as.character(fulladdress$postal_code)
  #return postcode
  return (postal_code)
}

# Example function call

postcodeLookup("University of Southampton, Highfield Campus, UK")