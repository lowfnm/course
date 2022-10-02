import { rule, shield } from 'graphql-shield';
import * as _ from 'lodash';

const rules = {
  isAuthenticated: rule()(async (_parent, _args, context) => {
    return !_.isEmpty(context.user);
  })
};

const permissions = shield({
  Query: {
    // hello: rules.isAuthenticated
  }
});

export default permissions;
