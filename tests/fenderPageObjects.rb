  require 'watir-webdriver'
require 'test/unit'
include Test::Unit::Assertions

class Fender

    def self.start(browserType)
      $browser = Watir::Browser.new :"#{browserType}"
    end


    def self.navigate(url)
       $browser.goto url
       title = $browser.title
       assert_equal("Fender: The Spirit of Rock 'n' Roll since 1946", title)
       puts 'navigation successful'
    end

    def self.goToCatalogPage()
        $browser.p(:text => 'Fender Summer Shop').click
        assert_equal('Summer Shop | Fender', $browser.title)
        puts 'catalog page navigation successful'
    end

    def self.goToProductPage(productText)
      productTitle = $browser.div(:text => productText).parent
      productTitle.click
      productName = $browser.h1(:class => 'prod-name h3').text
      assert_equal(productName, (productText.upcase))
      puts 'product page navigation successful'
    end

    def self.addToCart()
     price = $browser.span(:class => 'price-sales').text
     $browser.span(:text => 'Add to Cart').click
     $browser.span(:text => 'View Cart').click
     sleep 3
    #  $browser.button.span(:text => 'Secure Checkout').wait_until_present
     puts 'add to cart successful'
     return price
    end

    def self.verifyCart(price, qty)
      assert_equal(($browser.span(:class => 'product-price price-total').text), price)
      assert_equal(($browser.select_list(:id => 'dw_frmquantity').selected_options.map(&:text)[0]), qty)
      puts 'cart verified'
    end

    def self.goToCheckout()
      $browser.button(:type => 'submit', :index => 4).click
      $browser.h6(:text => 'New Customers').wait_until_present
      $browser.button(:name => 'dwfrm_login_unregistered').click
      puts 'on checkout page'
    end

    def self.shipping()
      $browser.text_field(:id => 'dwfrm_singleshipping_shippingAddress_addressFields_firstName').set 'Vishal'
      $browser.text_field(:id => 'dwfrm_singleshipping_shippingAddress_addressFields_lastName').set 'Mhatre'
      $browser.text_field(:id => 'dwfrm_singleshipping_shippingAddress_addressFields_address1').set '300 N ABC Blvd'
      $browser.text_field(:id => 'dwfrm_singleshipping_shippingAddress_addressFields_city').set 'Los Angeles'
      $browser.select_list(:id => 'dwfrm_singleshipping_shippingAddress_addressFields_states_state').select 'California'
      $browser.text_field(:id => 'dwfrm_singleshipping_shippingAddress_addressFields_zip').set '90036'
      $browser.text_field(:id => 'dwfrm_singleshipping_shippingAddress_addressFields_phone').set '408-250-9035'
      $browser.button(:text => 'Continue').click
      $browser.h5(:text => 'Enter Payment Method').wait_until_present
      puts 'shipping entered'
    end

    def self.end()
      $browser.quit
    end

end
