describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it('navigates to the product details page', () => {
    cy.get('[data-cy="product_details"]').first().click()
  });

})