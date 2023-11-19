use starknet::ContractAddress;

#[starknet::interface]
trait IStorage<TContractState> {
    fn get_val(self: @TContractState) -> u8;
    fn set_val(ref self: TContractState, num: u8);
}

#[starknet::contract]
mod Storage {
    #[storage]
    struct Storage {
        number: u8,
    }

    #[external(v0)]
    impl Storage of super::IStorage<ContractState> {
        fn get_val(self: @ContractState) -> u8 {
            let num = self.number.read();
            num
        }

        fn set_val(ref self: ContractState, num: u8) {
            self.number.write(num);
        }
    }
}
