package edu.fin.upa.workspace.model.vo;

public class WorkspaceJoin {
	private int memberNo;
	private int workNo;
	private String memberRank;
	
	
	public WorkspaceJoin() {}

	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getWorkNo() {
		return workNo;
	}
	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}
	public String getMemberRank() {
		return memberRank;
	}
	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}


	@Override
	public String toString() {
		return "WorkspaceJoin [memberNo=" + memberNo + ", workNo=" + workNo + ", memberRank=" + memberRank + "]";
	}
	
}
