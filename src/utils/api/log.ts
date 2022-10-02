const log = async (resolve: () => any, parent: any, atgs: any, ctx: any, info: any) => {
  try {
    return await resolve();
  } catch (e) {
    console.log(e);
  }
};

export default log;
