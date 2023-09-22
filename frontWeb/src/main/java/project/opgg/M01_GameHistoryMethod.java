package project.opgg;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import project.opgg.VO.ContentTeamHistory;
import project.opgg.VO.GameHistory;
import project.opgg.VO.User;

public class M01_GameHistoryMethod {
	
	//평균 킬
	public double getUserAvgKill(String userId) {
		double avgKill = 0;
		D01_GHDao gh = new D01_GHDao();
		List<GameHistory> uh = gh.getUserGameHistory(userId);
		int tot=0;
		for(GameHistory g:uh) {
			tot+=g.getKill();
		}
		
		double totD = tot;
		avgKill = Math.round((totD/uh.size()*10)/10.0);
		
		return avgKill;
	}

	
	//평균 데스
	public double getUserAvgDeath(String userId) {
		double avgDeath = 0;
		D01_GHDao gh = new D01_GHDao();
		List<GameHistory> uh = gh.getUserGameHistory(userId);
		int tot=0;
		for(GameHistory g:uh) {
			tot+=g.getDeath();
		}
		double totD = tot;
		avgDeath = Math.round((totD/uh.size()*10)/10.0);
		
		return avgDeath;
	}
	
	//평균 어시
	public double getUserAvgAssist(String userId) {
		double avgAssist = 0;
		D01_GHDao gh = new D01_GHDao();
		List<GameHistory> uh = gh.getUserGameHistory(userId);
		int tot=0;
		for(GameHistory g:uh) {
			tot+=g.getAssist();
		}
		double totD = tot;
		avgAssist = Math.round((totD/uh.size()*10))/10.0;
		
		return avgAssist;
	}
	
	//평점
	public double getUserAvgRatio(String userId) {
		M01_GameHistoryMethod m = new M01_GameHistoryMethod();
		double avgKill = m.getUserAvgKill(userId);
		double avgDeath = m.getUserAvgDeath(userId);
		double avgAssist = m.getUserAvgAssist(userId);
		double avgRatio = 0;
		double avg = (avgKill+avgAssist)/avgDeath;
		avgRatio = Math.round(avg*100)/100.0;
		
		return avgRatio;
	}

	// 티어
		public String getUserTier(String userId) {
			D06_UserDao udao = new D06_UserDao();
			List<User> gq = udao.getUserInfo(userId);
			String tier = gq.get(0).getuTier();

			return tier;
		}

		// 게임모드
		public String getGameQue(String userId, int idx) {
			D01_GHDao dao = new D01_GHDao();
			List<GameHistory> gq = dao.getUserGameHistory(userId);
			String[] gc = gq.get(idx).getGameCode().split("-");
			String gameCode = gc[0];

			return gameCode;
		}

	// 시작 시간
		public String getTime(String userId, int idx) {
			SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일 HH시 mm분");
			D01_GHDao dao = new D01_GHDao();
			List<GameHistory> gq = dao.getUserGameHistory(userId);

			String st = sf.format(gq.get(idx).getStart_time());

			return st;
		}

		// 게임 시간
		public String getGameTime(String userId, int idx) {
			D01_GHDao dao = new D01_GHDao();
			List<GameHistory> gq = dao.getUserGameHistory(userId);

			Date d1 = gq.get(idx).getStart_time();
			Date d2 = gq.get(idx).getEnd_time();

			long timeResult = d1.getTime() - d2.getTime();

			long gameTimeMin = timeResult / (60 * 1000);
			long gameTimeSec = timeResult % (60 * 1000);

			return gameTimeMin + "분" + gameTimeSec + "초";

		}
		public Map<String,String> getUserKAA(String gamecode){
			D01_GHDao gh = new D01_GHDao();
			Map<String,String> userKaMap = new HashMap<>();
			
			List<ContentTeamHistory> CTHlist = new ArrayList<>();
			CTHlist = gh.getContentTeamHistory(gamecode);
			
			double bteamKill = 0;
			double rteamKill = 0;
			
			for(ContentTeamHistory ct:CTHlist) {
				if(ct.getTeamcolor().equals("BLUE")) {
					bteamKill += ct.getKill();
				} else {
					rteamKill += ct.getKill();
				}
			}
			
			int userka = 0;
			for(ContentTeamHistory ct:CTHlist) {
				double kill = ct.getKill();
				double assi = ct.getAssist();
				if(ct.getTeamcolor().equals("BLUE")) {
					userka = (int)((kill+assi)/bteamKill*100);
				} else {
					userka = (int)((kill+assi)/rteamKill*100);
				}
				userKaMap.put(ct.getUserid(), userka+"%");
			}
			
			return userKaMap;
		}

	

	public int getWin(String userid) {
		D01_GHDao gh = new D01_GHDao();
		List<GameHistory> ghlist = gh.getUserGameHistory(userid);
		int win = 0;

		for (int i = 0; i < ghlist.size(); i++) {
			if ((ghlist.get(i).getIsWin()).equals("Win")) {
				win++;
			}
		}
		return win;
	}

	public int getLost(String userid) {
		D01_GHDao gh = new D01_GHDao();
		List<GameHistory> ghlist = gh.getUserGameHistory(userid);
		int lost = 0;

		for (int i = 0; i < ghlist.size(); i++) {
			if ((ghlist.get(i).getIsWin()).equals("Lose")) {
				lost++;
			}
		}
		return lost;
	}
	
	

}
