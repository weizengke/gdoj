package com.util;

import java.util.ArrayList;
import java.util.List;


public class CalcRating {
   
	 public static final int INITIAL = 1500;		//initial rating for all users
	public static final int PROVISIONAL = 250;		//may consider 250 points as a range for the ratings
	/** This is the maximum number of points up for grabs in a game. */
    public static final int K_MAX = 2;			//ratings<2000
    public static final int K_MID = 2;			//ratings>=2000 && ratings<=2400
    public static final int K_MIN = 2;			//ratings>2400   
    public static final double WIN = 1;
    public static final double LOSE = 0;
    public static final double EQU = 0.5;	//no one win or lose
 
    public static List<Double> expectancy(List<Integer> oldRating) {
    	List<Double> probabilities = new ArrayList<Double>();	
    	for(int u=0;u<oldRating.size();u++){
    		double ex = 0.0;
    		for(int o=0;o<oldRating.size();o++){
    			if(u!=o){
    				ex += 1.0/(1.0+Math.pow(10.0,(oldRating.get(o)-oldRating.get(u))/400.0));
    			}
    			
    		}   		
    		probabilities.add(ex);
    	}
    	return probabilities;
    }
    
    public static List<Double> score(List<Integer>userRank) {
    	List<Double> scores = new ArrayList<Double>();
    	for(int u=0;u<userRank.size();u++){
    		double score = 0.0;
    		for(int r=0;r<userRank.size();r++){     		
    			if(u!=r){
    				if(userRank.get(u)<userRank.get(r)){
        				score += WIN;      			
        			}else if(userRank.get(u)>userRank.get(r)){
        				score += LOSE;       				
        			}else{
        				score += EQU;
        			}
    			}
    		}
    		scores.add(score);
    	}   	
    	return scores;
    }
    
    public static List<Integer> initialize(List<Integer> contestTimes,List<Integer> oldRating){
    	List<Integer> oldRating_ = new ArrayList<Integer>();
    	for(int i=0;i<contestTimes.size();i++){
    		if(contestTimes.get(i)<1){
    			oldRating_.add(INITIAL);
    		}else oldRating_.add(oldRating.get(i));
    	}
    	return oldRating_;
    }   
    /*
     * 
     * 
     	K = 30 (was 25) for a player new to the rating list until s/he has completed events with a total of at least 30 games.[15]
		K = 15 as long as a player's rating remains under 2200.
		K = 10 once a player's published rating has reached 2200, and s/he has also completed events with a total of at least 30 games. Thereafter it remains permanently at 10.
     * 
     */
    //return grabs
    public static List<Integer> calc(List<Integer> contestTimes,List<Integer> oldRating,List<Integer> userRank) {    	
    	List<Double> scores = new ArrayList<Double>();
    	List<Double> probabilities = new ArrayList<Double>();   	
    	List<Integer> grabRating = new ArrayList<Integer>();	
    
    	Integer K = new Integer(K_MAX);
    	scores = score(userRank);
    	
    	probabilities = expectancy(oldRating);
    	
    	for(int i=0;i<oldRating.size();i++){
    		if(oldRating.get(i)>2200){
    			K=K_MIN;
    		}else if(contestTimes.get(i)<30){
    			K=K_MAX;
    		}else{
    			K=K_MID;   
    		}
    		double tmp = K*(scores.get(i)-probabilities.get(i));
    		int tmp_int = (int) tmp;
    		grabRating.add(tmp_int);
    	}	
    	return grabRating;
    }
}
