const Web3 = require('web3');
const Coin = require('./contracts/KingCoin.json');

const init = async () => {
    const web3 = new Web3('http://127.0.0.1:9545/');
    const contract = await new web3.eth.Contract(Coin.abi, '0x3478b03b6080D47875A07D3e22ee686b30fD9c14');
    const name = await contract.methods.name().call();
    const symbol = await contract.methods.symbol().call();
    const totalSupply = await contract.methods.totalSupply().call();
    const decimals = await contract.methods.decimals().call();

    const Inibalance = await contract.methods.balanceOf('0x6006e67c372c6dfcc2058f0b4460e90c5c36afa1').call();
    await contract.methods.transfer('0xd51efb82bea7879410ea21e2cc1ec0e653f2f7d8',10000)
    .send({from:'0x6006e67c372c6dfcc2058f0b4460e90c5c36afa1'}); 
    const balance = await contract.methods.balanceOf('0x6006e67c372c6dfcc2058f0b4460e90c5c36afa1').call();
    const receiveBalance = await contract.methods.balanceOf('0xd51efb82bea7879410ea21e2cc1ec0e653f2f7d8').call();

    console.log(name, symbol, totalSupply, decimals);
    console.log(Inibalance, balance, receiveBalance);

}
init();
