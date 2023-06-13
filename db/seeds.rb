require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here

Container.destroy_all
Tag.destroy_all
Event.destroy_all

3.times do
    container = Container.create(
        name: Faker::Internet.domain_word,
        domain_name: Faker::Internet.domain_suffix
    )
end

# GTM Tags are little snippets of code that you can activate on your page based on particular conditions (configured in GTM).
# Tag Naming convention: [type of the tag/vendor] [additional type (if needed)] – [short description about what the tag does]. 
# Tag - attempted to create custom data using faker.helpers but it's not available in ported version of Faker for Ruby

# 5.times do
#   tag = Tag.create(       
#       type_tag: faker.helpers.fake('{{App.name}} {{helpers.arrayElement(["Pixel", "Conversion Tracking", "GA4 Events"])}}'),
#       container_id: faker.helpers.arrayElement([1, 2, 3])
#   )
# end

tag = Tag.create([
{
    name: "Facebook - Standard Event - CTA Pageview",
    type_tag: "Facebook Pixel",
    container_id: 1
},
{
    name: "Facebook - Custom Conversion - Registered Page",
    type_tag: "Facebook Pixel",
    container_id: 1
},
{
    name: "Facebook - Custom Conversion - Registered Page",
    type_tag: "Facebook Pixel",
    container_id: 2
},
{
    name: "Google Ads - Remarketing - High Value Events",
    type_tag: "Google Ads Conversion Tracking",
    container_id: 3
},
{
    name: "GA4 Config - Custom Event",
    type_tag: "GA4 Event",
    container_id: 1
},
{
    name: "GA4 Config - Custom Event",
    type_tag: "GA4 Event",
    container_id: 2
},
{
    name: "GA4 Config - Custom Event",
    type_tag: "GA4 Event",
    container_id: 3
},
{
    name: "GA Pageview - All pages",
    type_tag: "GA4 Event",
    container_id: 2
}
])

# Events are 'triggered' in GTM, so Event objects contain trigger and event names and features
# Triggers are conditions when a tag should (or shouldn’t) fire. Based on their nature, triggers can be: 'Regular' or 'Blocking'
# Trigger naming convention: [trigger type] – [what does that trigger do].
# Event - attempted to create custom data using faker.helpers but it's not available in ported version of Faker for Ruby

# 10.times do
#     event = Event.create(
#         trigger_name: Faker::helpers.fake('{{helpers.arrayElement(["Link Click - outbound link", "Click - Register button", "Dom Ready", "Custom Checkout"])}}'),
#         type_event: Faker::helpers.arrayElement(['pageview', 'click', 'conversion']),
#         event_name: Faker::helpers.fake('{{helpers.arrayElement(["Product", "CTA", "Slider", "Nav" "Checkout", "Video", "Sizes"])}}'),
#         tag_id: Faker::helpers.arrayElement([1, 2, 3, 4, 5]),
#         container_id: Faker::helpers.arrayElement([1, 2, 3])
#     )
# end

event = Event.create([
{
    trigger_name: "Link Click - outbound link", 
    type_event: "click",
    event_name: "visit_partner_site", 
    tag_id: 1,
    container_id: 1
},
{
    trigger_name: "Dom Ready - Product Page", 
    type_event: "pageview",
    event_name: "product_viewed",
    tag_id: 1,
    container_id: 1
},
{
    trigger_name: "Click - Signup Button", 
    type_event: "click",
    event_name: "signup_start",
    tag_id: 1, 
    container_id: 1
},
{
    trigger_name: "Conversion - Signup Submit",
    type_event: "conversion",
    event_name: "singup_success",
    tag_id: 2,
    container_id: 1
},
{
    trigger_name: "Click - Selected Product",
    type_event: "click",
    event_name: "product_selected",
    tag_id: 4,
    container_id: 1
},
{
    trigger_name: "Conversion - Registered Page",
    type_event: "conversion",
    event_name: "registration_success",
    tag_id: 2,
    container_id: 2
},
{
    trigger_name: "Click - Apply Discount Button",
    type_event: "click",
    event_name: "apply_discount",
    tag_id: 4, 
    container_id: 2
},
{
    trigger_name: "Click - Wishlist Button",
    type_event: "click",
    event_name: "add_to_wishlist",
    tag_id: 4, 
    container_id: 2
},
{
    trigger_name: "Pageview - Cart Page",
    type_event: "pageview",
    event_name: "view_cart",
    tag_id: 5,
    container_id: 2
},

{
    trigger_name: "Click - Free Trial Button",
    type_event: "click",
    event_name: "free_trial",
    tag_id: 3,
    container_id: 3
},
{
    trigger_name: "Click - Carousel Interaction",
    type_event: "click",
    event_name: "carousel_interaction",
    tag_id: 3,
    container_id: 3
},
{
    trigger_name: "Click - Navigation Link",
    type_event: "click",
    event_name: "nav_selection",
    tag_id: 4,
    container_id: 3
}
    
])

puts "✅ Done seeding!"
