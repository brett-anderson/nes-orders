# Ollie Code Challenge

## Deployment
  - Deployed to https://nes-orders.herokuapp.com/

## Libraries Used
  - Rails backend
  - Rails views frontend
  - Postgres database
  - [nes.css](https://nostalgic-css.github.io/NES.css/) css framework
  - Flexbox for layout
  - rspec for testing
  - FactoryBot and Faker for test mocks
  - MoneyRails gem for handling money

## Testing
tests can be run with `rspec`

## Considerations and Assumptions
- __Where's the Frontend Framework?__
  - I decided to forgo a javascript framework and use plain old rails views for simplicity, as all the required functionality was basic enough to achieve in rails. This was achievable because of the freedom around UX design, as I have found designing functionality in rails views requires adhering to rails patterns and practices around forms and general restfullness. If there were more stringent UX requirements, this would be better served by a javascript SPA with a rails backend.
- __Taxes__
  - I briefly looked into an API to calculate taxes based on location, but decided to hard-code a 5% GST an 7% PST.
- __Searching__
  - I used postgres's `ILIKE` to find products.
- __Status behavior__
  - It seemed to make sense to limit adding products to an order only when it is in draft mode. A user can update an order from draft to either submitted or cancelled, which disables product adding.
- __Error Handling__
  - Currently no error handling in the controllers, definitely something that I would add but felt like out of scope for a project like this.
- __Pagination__
  - Currently no pagination for orders or products, but would be something to add for a real project.
- __Product Image Hosting__
  - Images for the products are saved in the repo, but can easily be refactored to using Active Storage. 