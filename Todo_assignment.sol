// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

contract Todo{

    struct TodoModel{
        uint index;
        string todoName;
        string todoDes;
    }

    mapping(address => TodoModel[]) todoMap;

    function addLoginUserTodos(uint _id, string memory _todoText, string memory _todoDes) public {
        TodoModel memory todoModel = TodoModel(_id, _todoText,_todoDes);
        todoMap[msg.sender].push(todoModel);
    }

    function getLoginUserTodosData() public view returns(TodoModel[] memory){
        return todoMap[msg.sender];
    }

    function getLoginUserTodosData(uint index) public view returns(TodoModel memory){
        return todoMap[msg.sender][index];
    }

    function deleteLoginUserTodoData() public {
        delete todoMap[msg.sender];
    }

    function updateLoginUserTodoData(uint _index, string memory _todoText, string memory _todoDes) public{
        TodoModel memory todoModel = TodoModel(_index, _todoText,_todoDes);
        todoMap[msg.sender][_index] = todoModel;
    }

    function deleteLoginUserSpecificIndex(uint index) public  {
        if(index >= todoMap[msg.sender].length) return;
        for  (uint i = index; i < todoMap[msg.sender].length - 1; i++){
            todoMap[msg.sender][i] = todoMap[msg.sender][i+1];
        }
        todoMap[msg.sender].pop();
    }

    //This is for Other Login user Data todos.

   function addOtherUserTodos(address _addressInfo, uint _id, string memory _todoText, string memory _todoDes) public {
        TodoModel memory todoModel = TodoModel(_id, _todoText,_todoDes);
        todoMap[_addressInfo].push(todoModel);
    }

    function getOtherPeopleTodosData(address _address)  public view returns(TodoModel[] memory){
        return todoMap[_address];
    }

    function getOtherUserTodosData(address _addressInfo, uint index) public view returns(TodoModel memory){
        return todoMap[_addressInfo][index];
    }

    function deleteOtherUserTodoData(address _addressInfo) public {
        delete todoMap[_addressInfo];
    }

    function deleteOtherUserSpecificIndex(address _address,uint index) public  {
        if(index >= todoMap[_address].length) return;
        for  (uint i = index; i < todoMap[_address].length - 1; i++){
            todoMap[_address][i] = todoMap[_address][i+1];
        }
        todoMap[_address].pop();
    }

    function updateOtherUserTodoData(address _address, uint _index, string memory _todoText, string memory _todoDes) public{
        TodoModel memory todoModel = TodoModel(_index, _todoText,_todoDes);
        todoMap[_address][_index] = todoModel;
    }
}