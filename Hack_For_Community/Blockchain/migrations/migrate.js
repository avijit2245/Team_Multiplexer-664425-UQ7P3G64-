const color=artifacts.require('../contracts/Color.sol')

module.exports = {
    networks: {
      development: {
        host: "localhost",
        port: 7545,
        network_id: "5777"
      }
      // live: { ... }
    }
  };
  