describe('Add To Cart', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/');
  });

  it('adds an item to the cart', () => {
    cy.get('button').contains('Add').first().click({force: true});
    cy.contains('.nav-link', 'My Cart (1)').should('be.visible')
  })

});