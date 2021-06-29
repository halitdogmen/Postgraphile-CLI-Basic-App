const request = require("supertest");

let register = `
mutation RegisterPerson {
    registerPerson(
      input: {firstName: "Test", lastName: "User", email: "test@forest.com", password: "12345678a"}
    ) {
      person {
        id
        firstName
        lastName
      }
    }
  }
  `;
describe("Register",() => {
  it("User Registration", async () => {
    const test = await request('http://localhost:5000')
      .post('/graphql')
      .send({query:register})
      .expect(200);
      expect(test.body.data.registerPerson.person.id).toBeDefined();
      expect(test.body.data.registerPerson.person.firstName).toStrictEqual('Test');
      expect(test.body.data.registerPerson.person.lastName).toStrictEqual('User');

  });

  it("User Registiration dublicate email", async () => {
    const test = await request('http://localhost:5000')
      .post('/graphql')
      .send({query:register})
      .expect(200);
      expect(test.body.errors[0].message).toStrictEqual('duplicate key value violates unique constraint "person_account_email_key"');

  });
});