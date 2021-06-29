const request = require("supertest");

let login =`
mutation AuthenticatePerson($email: String!, $password: String!) {
  authenticate(input: { email: $email, password: $password }) {
    jwt
  }
}
`
let variables = {
  email : "test@forest.com",
  password : "12345678a"
}

describe("Login",() => {
    it("User Login", async () => {
      const test = await request('http://localhost:5000')
        .post('/graphql')
        .send({query:login,variables:variables})
        .expect(200);
        expect(test.body.data.authenticate.jwt).toBeDefined();
    });
  });