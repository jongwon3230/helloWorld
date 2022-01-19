package com.project.springboot.dto;

public class PagingDto {
	private int numPerPage = 10; //한 페이지에 표시할 게시글 수 사용자 지정
	private int blockSize = 5; //환 화면에 표시할 페이지 수 사용자 지정
	private int nowPage = 1; //현재 페이지 초기값1
	private int boardNum; //총 게시글 수 == 불러온 데이터의 수
	private int totalPageNum; // 총 페이지 수
	private int totalBlockNum;// 총 블록 수
	private int nowBlock;
	private int lastPageBoardNum; //마지막 페이지에 나타낼 게시글 수
	private int startNum;
	private int lastNum;
	
	

	public PagingDto(int boardNum) {
		this.boardNum = boardNum;
		if(boardNum % numPerPage == 0) this.totalPageNum = boardNum / numPerPage;
		else this.totalPageNum = boardNum / numPerPage + 1; 
		
		this.totalBlockNum = (totalPageNum - 1) / blockSize + 1;
		this.lastPageBoardNum = boardNum % numPerPage;
		this.nowBlock = 1;
		this.startNum = 1;
		
		if(totalPageNum < 5 ) this.lastNum = totalPageNum;
		else this.lastNum = startNum + blockSize - 1;
		
	}
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public int getTotalBlockNum() {
		return totalBlockNum;
	}
	public void setTotalBlockNum(int totalBlockNum) {
		this.totalBlockNum = totalBlockNum;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getLastPageBoardNum() {
		return lastPageBoardNum;
	}
	public void setLastPageBoardNum(int lastPageBoardNum) {
		this.lastPageBoardNum = lastPageBoardNum;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	
	
}
