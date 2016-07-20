require_relative './fenderPageObjects'

Fender.start('chrome')
Fender.navigate('http://shop.fender.com/en-US/')
Fender.goToCatalogPage
Fender.goToProductPage('CF-60 Folk with Case')
price = Fender.addToCart()
Fender.verifyCart(price, '1')
Fender.goToCheckout
Fender.shipping
Fender.end
