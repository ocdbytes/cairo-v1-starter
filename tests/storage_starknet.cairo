use hello_starknet::contract::storage::IStorageDispatcherTrait;
use snforge_std::{declare, ContractClassTrait};
use hello_starknet::contract::storage::IStorageDispatcher;

#[test]
fn get_val_test() {
    let contract = declare('Storage');
    let contract_address = contract.deploy(@ArrayTrait::new()).unwrap();

    let dispatcher = IStorageDispatcher { contract_address };

    let num = dispatcher.get_val();
    assert(num == 0, 'Init val should be 0');
}

#[test]
fn set_and_get_val_test() {
    let contract = declare('Storage');
    let contract_address = contract.deploy(@ArrayTrait::new()).unwrap();

    let dispatcher = IStorageDispatcher { contract_address };

    let txn = dispatcher.set_val(10);
    let num = dispatcher.get_val();
    assert(num == 10, 'Val should be 10');
}
