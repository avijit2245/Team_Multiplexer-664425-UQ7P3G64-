

const Color =artifacts.require('../contracts/Color.sol')

require('chai')
.use(require('chai-as-promised'))
.should();

contract('Color',(accounts)=>{
    let contract;

    before (async()=>{
        contract=await Color.deployed()
    })

    describe('deployment',async()=>{
        it('deploys successfully', async()=>{
            const address=await contract.address;
            assert.notEqual(address,'')
            assert.notEqual(address,null)
            assert.notEqual(address,undefined)

        })

        it('it has a name',async()=>{
            const name=await contract.name;
            assert.Equal(name,'color')
        })
    })
    describe('minting',async()=>{
        it('is a new token',async()=>{
            const result =await contract.mint('#FFFFFF')
            const totalsupply=await contract.totalsupply()
            assert.equal(totalsupply,1)
            console.log(result)
            const event =result.logs[0].args
            assert.equal(event.tokenId.toNumber(),1,'NUmber is correct')
            assert.equal(event.from,'0*00000000000000000000000','from is correct')
        })
    })

    
})