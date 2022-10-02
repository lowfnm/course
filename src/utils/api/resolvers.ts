const resolvers = {
  Query: {
    hello: (parrent: any, args: any, context: any) => 'task!'
  }
};

export default resolvers;
