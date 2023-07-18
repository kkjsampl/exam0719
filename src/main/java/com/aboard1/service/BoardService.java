package com.aboard1.service;

import java.time.*;
import java.util.*;

import org.mindrot.jbcrypt.*;

import com.aboard1.vo.*;

public class BoardService {
	private final static BoardService service = new BoardService();
	private BoardService() {
	}
	public static BoardService getInstance() {
		return service;
	}
	
	private ArrayList<Board> list = new ArrayList<>();
	private Long bno = 1L;
	
	public void create(String title, String content, String nickname, String password) {
		String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		Board board = new Board(bno++, title, content, LocalDate.now(), 0L, nickname, encodedPassword);
		list.add(board);
	}
	
	public ArrayList<Board> list() {
		return list;
	}
	
	public Board read(Long bno) {
		for(Board board:list) {
			if(board.getBno().equals(bno)) {
				board.setReadcnt(board.getReadcnt()+1); 
				return board;
			}
		}
		return null;
	}
	
	public Boolean update(Long bno, String title, String content, String password) {
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getBno().equals(bno)) {
				if(BCrypt.checkpw(password, list.get(i).getPassword())) {
					list.get(i).setTitle(title);
					list.get(i).setContent(content);
					return true;
				}
			}
		}
		return false;
	}
	
	
	public Boolean delete(Long bno, String password) {
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getBno().equals(bno)) {
				if(BCrypt.checkpw(password, list.get(i).getPassword())) {
					list.remove(i);
					return true;
				} 
			}
		}
		return false;
	}
}
