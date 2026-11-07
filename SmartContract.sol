// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NoteBoard - a tiny public notice board for MG3012 Assignment 2
/// @notice Anyone can post a note and like notes. Everything is stored on-chain.
contract NoteBoard {
    struct Note {
        address author;
        string text;
        uint256 likes;
        uint256 timestamp;
    }

    Note[] private notes;
    address public owner;

    event NotePosted(uint256 indexed id, address indexed author, string text);
    event NoteLiked(uint256 indexed id, address indexed liker, uint256 totalLikes);

    constructor() {
        owner = msg.sender;
    }

    // WRITE 1: post a new note
    function postNote(string calldata _text) external {
        require(bytes(_text).length > 0, "Note cannot be empty");
        require(bytes(_text).length <= 140, "Max 140 characters");
        notes.push(Note(msg.sender, _text, 0, block.timestamp));
        emit NotePosted(notes.length - 1, msg.sender, _text);
    }

    // WRITE 2: like a note
    function likeNote(uint256 _id) external {
        require(_id < notes.length, "Note does not exist");
        notes[_id].likes += 1;
        emit NoteLiked(_id, msg.sender, notes[_id].likes);
    }

    // READ 1: how many notes exist
    function getTotalNotes() external view returns (uint256) {
        return notes.length;
    }

    // READ 2: get one note by its id
    function getNote(uint256 _id)
        external
        view
        returns (address author, string memory text, uint256 likes, uint256 timestamp)
    {
        require(_id < notes.length, "Note does not exist");
        Note storage n = notes[_id];
        return (n.author, n.text, n.likes, n.timestamp);
    }
}
