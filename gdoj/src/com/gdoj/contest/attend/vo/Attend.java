package com.gdoj.contest.attend.vo;

import java.io.Serializable;

public class Attend implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer contest_id;
	private String username;
	private Integer solved;
	private Integer score;
	private Integer penalty;
	private String defunct;
	
	private Integer A_time;
	private Integer A_wrongsubmits;
	private Integer B_time;
	private Integer B_wrongsubmits;
	private Integer C_time;
	private Integer C_wrongsubmits;
	private Integer D_time;
	private Integer D_wrongsubmits;
	private Integer E_time;
	private Integer E_wrongsubmits;
	private Integer F_time;
	private Integer F_wrongsubmits;
	private Integer G_time;
	private Integer G_wrongsubmits;
	private Integer H_time;
	private Integer H_wrongsubmits;
	private Integer I_time;
	private Integer I_wrongsubmits;
	private Integer J_time;
	private Integer J_wrongsubmits;
	private Integer K_time;
	private Integer K_wrongsubmits;
	private Integer L_time;
	private Integer L_wrongsubmits;
	private Integer M_time;
	private Integer M_wrongsubmits;
	private Integer N_time;
	private Integer N_wrongsubmits;
	private Integer O_time;
	private Integer O_wrongsubmits;
	private Integer P_time;
	private Integer P_wrongsubmits;
	private Integer Q_time;
	private Integer Q_wrongsubmits;
	private Integer R_time;
	private Integer R_wrongsubmits;
	private Integer S_time;
	private Integer S_wrongsubmits;
	private Integer T_time;
	private Integer T_wrongsubmits;
	private Integer U_time;
	private Integer U_wrongsubmits;
	private Integer V_time;
	private Integer V_wrongsubmits;
	private Integer W_time;
	private Integer W_wrongsubmits;
	private Integer X_time;
	private Integer X_wrongsubmits;
	private Integer Y_time;
	private Integer Y_wrongsubmits;
	private Integer Z_time;
	private Integer Z_wrongsubmits;
	


	public Attend() {
		this.defunct="N";
		this.solved= 0;
		this.score=0;
		this.penalty= 0;
		this.A_time= 0;
		this.A_wrongsubmits= 0;
		this.B_time= 0;
		this.B_wrongsubmits= 0;
		this.C_time= 0;
		this.C_wrongsubmits= 0;
		this.D_time= 0;
		this.D_wrongsubmits= 0;
		this.E_time= 0;
		this.E_wrongsubmits= 0;
		this.F_time= 0;
		this.F_wrongsubmits= 0;
		this.G_time= 0;
		this.G_wrongsubmits= 0;
		this.H_time= 0;
		this.H_wrongsubmits= 0;
		this.I_time= 0;
		this.I_wrongsubmits= 0;
		this.J_time= 0;
		this.J_wrongsubmits= 0;
		this.K_time= 0;
		this.K_wrongsubmits= 0;
		this.L_time= 0;
		this.L_wrongsubmits= 0;
		this.M_time= 0;
		this.M_wrongsubmits= 0;
		this.N_time= 0;
		this.N_wrongsubmits= 0;
		this.O_time= 0;
		this.O_wrongsubmits= 0;
		this.P_time= 0;
		this.P_wrongsubmits= 0;
		this.Q_time= 0;
		this.Q_wrongsubmits= 0;
		this.R_time= 0;
		this.R_wrongsubmits= 0;
		this.S_time= 0;
		this.S_wrongsubmits= 0;
		this.T_time= 0;
		this.T_wrongsubmits= 0;
		this.U_time= 0;
		this.U_wrongsubmits= 0;
		this.V_time= 0;
		this.V_wrongsubmits= 0;
		this.W_time= 0;
		this.W_wrongsubmits= 0;
		this.X_time= 0;
		this.X_wrongsubmits= 0;
		this.Y_time= 0;
		this.Y_wrongsubmits= 0;
		this.Z_time= 0;
		this.Z_wrongsubmits= 0;
	}
	
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getSolved() {
		return solved;
	}
	public void setSolved(Integer solved) {
		this.solved = solved;
	}
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getContest_id() {
		return contest_id;
	}
	public void setContest_id(Integer contest_id) {
		this.contest_id = contest_id;
	}
	public Integer getPenalty() {
		return penalty;
	}
	public void setPenalty(Integer penalty) {
		this.penalty = penalty;
	}
	
	public Integer getA_time() {
		return A_time;
	}
	public void setA_time(Integer a_time) {
		A_time = a_time;
	}
	public Integer getA_wrongsubmits() {
		return A_wrongsubmits;
	}
	public void setA_wrongsubmits(Integer wrongsubmits) {
		A_wrongsubmits = wrongsubmits;
	}
	public Integer getB_time() {
		return B_time;
	}
	public void setB_time(Integer b_time) {
		B_time = b_time;
	}
	public Integer getB_wrongsubmits() {
		return B_wrongsubmits;
	}
	public void setB_wrongsubmits(Integer wrongsubmits) {
		B_wrongsubmits = wrongsubmits;
	}
	public Integer getC_time() {
		return C_time;
	}
	public void setC_time(Integer c_time) {
		C_time = c_time;
	}
	public Integer getC_wrongsubmits() {
		return C_wrongsubmits;
	}
	public void setC_wrongsubmits(Integer wrongsubmits) {
		C_wrongsubmits = wrongsubmits;
	}
	public Integer getD_time() {
		return D_time;
	}
	public void setD_time(Integer d_time) {
		D_time = d_time;
	}
	public Integer getD_wrongsubmits() {
		return D_wrongsubmits;
	}
	public void setD_wrongsubmits(Integer wrongsubmits) {
		D_wrongsubmits = wrongsubmits;
	}
	public Integer getE_time() {
		return E_time;
	}
	public void setE_time(Integer e_time) {
		E_time = e_time;
	}
	public Integer getE_wrongsubmits() {
		return E_wrongsubmits;
	}
	public void setE_wrongsubmits(Integer wrongsubmits) {
		E_wrongsubmits = wrongsubmits;
	}
	public Integer getF_time() {
		return F_time;
	}
	public void setF_time(Integer f_time) {
		F_time = f_time;
	}
	public Integer getF_wrongsubmits() {
		return F_wrongsubmits;
	}
	public void setF_wrongsubmits(Integer wrongsubmits) {
		F_wrongsubmits = wrongsubmits;
	}
	public Integer getG_time() {
		return G_time;
	}
	public void setG_time(Integer g_time) {
		G_time = g_time;
	}
	public Integer getG_wrongsubmits() {
		return G_wrongsubmits;
	}
	public void setG_wrongsubmits(Integer wrongsubmits) {
		G_wrongsubmits = wrongsubmits;
	}
	public Integer getH_time() {
		return H_time;
	}
	public void setH_time(Integer h_time) {
		H_time = h_time;
	}
	public Integer getH_wrongsubmits() {
		return H_wrongsubmits;
	}
	public void setH_wrongsubmits(Integer wrongsubmits) {
		H_wrongsubmits = wrongsubmits;
	}
	public Integer getI_time() {
		return I_time;
	}
	public void setI_time(Integer i_time) {
		I_time = i_time;
	}
	public Integer getI_wrongsubmits() {
		return I_wrongsubmits;
	}
	public void setI_wrongsubmits(Integer wrongsubmits) {
		I_wrongsubmits = wrongsubmits;
	}
	public Integer getJ_time() {
		return J_time;
	}
	public void setJ_time(Integer j_time) {
		J_time = j_time;
	}
	public Integer getJ_wrongsubmits() {
		return J_wrongsubmits;
	}
	public void setJ_wrongsubmits(Integer wrongsubmits) {
		J_wrongsubmits = wrongsubmits;
	}
	public Integer getK_time() {
		return K_time;
	}
	public void setK_time(Integer k_time) {
		K_time = k_time;
	}
	public Integer getK_wrongsubmits() {
		return K_wrongsubmits;
	}
	public void setK_wrongsubmits(Integer wrongsubmits) {
		K_wrongsubmits = wrongsubmits;
	}
	public Integer getL_time() {
		return L_time;
	}
	public void setL_time(Integer l_time) {
		L_time = l_time;
	}
	public Integer getL_wrongsubmits() {
		return L_wrongsubmits;
	}
	public void setL_wrongsubmits(Integer wrongsubmits) {
		L_wrongsubmits = wrongsubmits;
	}
	public Integer getM_time() {
		return M_time;
	}
	public void setM_time(Integer m_time) {
		M_time = m_time;
	}
	public Integer getM_wrongsubmits() {
		return M_wrongsubmits;
	}
	public void setM_wrongsubmits(Integer wrongsubmits) {
		M_wrongsubmits = wrongsubmits;
	}
	public Integer getN_time() {
		return N_time;
	}
	public void setN_time(Integer n_time) {
		N_time = n_time;
	}
	public Integer getN_wrongsubmits() {
		return N_wrongsubmits;
	}
	public void setN_wrongsubmits(Integer wrongsubmits) {
		N_wrongsubmits = wrongsubmits;
	}
	public Integer getO_time() {
		return O_time;
	}
	public void setO_time(Integer o_time) {
		O_time = o_time;
	}
	public Integer getO_wrongsubmits() {
		return O_wrongsubmits;
	}
	public void setO_wrongsubmits(Integer wrongsubmits) {
		O_wrongsubmits = wrongsubmits;
	}
	public Integer getP_time() {
		return P_time;
	}
	public void setP_time(Integer p_time) {
		P_time = p_time;
	}
	public Integer getP_wrongsubmits() {
		return P_wrongsubmits;
	}
	public void setP_wrongsubmits(Integer wrongsubmits) {
		P_wrongsubmits = wrongsubmits;
	}
	public Integer getQ_time() {
		return Q_time;
	}
	public void setQ_time(Integer q_time) {
		Q_time = q_time;
	}
	public Integer getQ_wrongsubmits() {
		return Q_wrongsubmits;
	}
	public void setQ_wrongsubmits(Integer wrongsubmits) {
		Q_wrongsubmits = wrongsubmits;
	}
	public Integer getR_time() {
		return R_time;
	}
	public void setR_time(Integer r_time) {
		R_time = r_time;
	}
	public Integer getR_wrongsubmits() {
		return R_wrongsubmits;
	}
	public void setR_wrongsubmits(Integer wrongsubmits) {
		R_wrongsubmits = wrongsubmits;
	}
	public Integer getS_time() {
		return S_time;
	}
	public void setS_time(Integer s_time) {
		S_time = s_time;
	}
	public Integer getS_wrongsubmits() {
		return S_wrongsubmits;
	}
	public void setS_wrongsubmits(Integer wrongsubmits) {
		S_wrongsubmits = wrongsubmits;
	}
	public Integer getT_time() {
		return T_time;
	}
	public void setT_time(Integer t_time) {
		T_time = t_time;
	}
	public Integer getT_wrongsubmits() {
		return T_wrongsubmits;
	}
	public void setT_wrongsubmits(Integer wrongsubmits) {
		T_wrongsubmits = wrongsubmits;
	}
	public Integer getU_time() {
		return U_time;
	}
	public void setU_time(Integer u_time) {
		U_time = u_time;
	}
	public Integer getU_wrongsubmits() {
		return U_wrongsubmits;
	}
	public void setU_wrongsubmits(Integer wrongsubmits) {
		U_wrongsubmits = wrongsubmits;
	}
	public Integer getV_time() {
		return V_time;
	}
	public void setV_time(Integer v_time) {
		V_time = v_time;
	}
	public Integer getV_wrongsubmits() {
		return V_wrongsubmits;
	}
	public void setV_wrongsubmits(Integer wrongsubmits) {
		V_wrongsubmits = wrongsubmits;
	}
	public Integer getW_time() {
		return W_time;
	}
	public void setW_time(Integer w_time) {
		W_time = w_time;
	}
	public Integer getW_wrongsubmits() {
		return W_wrongsubmits;
	}
	public void setW_wrongsubmits(Integer wrongsubmits) {
		W_wrongsubmits = wrongsubmits;
	}
	public Integer getX_time() {
		return X_time;
	}
	public void setX_time(Integer x_time) {
		X_time = x_time;
	}
	public Integer getX_wrongsubmits() {
		return X_wrongsubmits;
	}
	public void setX_wrongsubmits(Integer wrongsubmits) {
		X_wrongsubmits = wrongsubmits;
	}
	public Integer getY_time() {
		return Y_time;
	}
	public void setY_time(Integer y_time) {
		Y_time = y_time;
	}
	public Integer getY_wrongsubmits() {
		return Y_wrongsubmits;
	}
	public void setY_wrongsubmits(Integer wrongsubmits) {
		Y_wrongsubmits = wrongsubmits;
	}
	public Integer getZ_time() {
		return Z_time;
	}
	public void setZ_time(Integer z_time) {
		Z_time = z_time;
	}
	public Integer getZ_wrongsubmits() {
		return Z_wrongsubmits;
	}
	public void setZ_wrongsubmits(Integer wrongsubmits) {
		Z_wrongsubmits = wrongsubmits;
	}
	public Integer getACtime(Integer i) {
		switch(i)
		{
		case 1:
			return A_time;
		case 2:
			return B_time;
		case 3:
			return C_time;
		case 4:
			return D_time;
		case 5:
			return E_time;
		case 6:
			return F_time;
		case 7:
			return G_time;
		case 8:
			return H_time;
		case 9:
			return I_time;
		case 10:
			return J_time;
		case 11:
			return K_time;
		case 12:
			return L_time;
		case 13:
			return M_time;
		case 14:
			return N_time;
		case 15:
			return O_time;
		case 16:
			return P_time;
		case 17:
			return Q_time;
		case 18:
			return R_time;
		case 19:
			return S_time;
		case 20:
			return T_time;
		case 21:
			return U_time;
		case 22:
			return V_time;
		case 23:
			return W_time;
		case 24:
			return X_time;
		case 25:
			return Y_time;
		case 26:
			return Z_time;
		}
		return 0;
	}
	public Integer getwrongsubmits(Integer i) {
		switch(i)
		{
		case 1:
			return A_wrongsubmits;
		case 2:
			return B_wrongsubmits;
		case 3:
			return C_wrongsubmits;
		case 4:
			return D_wrongsubmits;
		case 5:
			return E_wrongsubmits;
		case 6:
			return F_wrongsubmits;
		case 7:
			return G_wrongsubmits;
		case 8:
			return H_wrongsubmits;
		case 9:
			return I_wrongsubmits;
		case 10:
			return J_wrongsubmits;
		case 11:
			return K_wrongsubmits;
		case 12:
			return L_wrongsubmits;
		case 13:
			return M_wrongsubmits;
		case 14:
			return N_wrongsubmits;
		case 15:
			return O_wrongsubmits;
		case 16:
			return P_wrongsubmits;
		case 17:
			return Q_wrongsubmits;
		case 18:
			return R_wrongsubmits;
		case 19:
			return S_wrongsubmits;
		case 20:
			return T_wrongsubmits;
		case 21:
			return U_wrongsubmits;
		case 22:
			return V_wrongsubmits;
		case 23:
			return W_wrongsubmits;
		case 24:
			return X_wrongsubmits;
		case 25:
			return Y_wrongsubmits;
		case 26:
			return Z_wrongsubmits;
		}
		return 0;
	}

}
