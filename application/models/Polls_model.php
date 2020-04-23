<?php

class Polls_Model extends CI_Model 
{

	public function create_poll($data)
	{
		$this->db->insert("user_polls", $data);
		return $this->db->insert_id();
	}

	public function get_poll($id) 
	{
		return $this->db
			->select("user_polls.ID, user_polls.userid, user_polls.name, 
				user_polls.question, user_polls.timestamp, 
				user_polls.show_results, user_polls.ip_restricted,
				user_polls.cookie_restricted, user_polls.public,
				user_polls.status, user_polls.votes, user_polls.created, 
				user_polls.updated, user_polls.user_restricted,
				user_polls.hash, user_polls.vote_type, user_polls.votes_today,
				user_polls.votes_today_timestamp, user_polls.votes_month,
				user_polls.votes_month_timestamp, user_polls.themeid,
				poll_themes.name as themename, poll_themes.css_code,
				users.premium_time, users.premium_planid")
			->where("user_polls.ID", $id)
			->join("poll_themes", "poll_themes.ID = user_polls.themeid", 
					"left outer")
			->join("users", "users.ID = user_polls.userid", "left outer")
			->get("user_polls");
	}

	public function get_user_poll($id, $userid) 
	{
		return $this->db
			->select("user_polls.ID, user_polls.userid, user_polls.name, 
				user_polls.question, user_polls.timestamp, 
				user_polls.show_results, user_polls.ip_restricted,
				user_polls.cookie_restricted, user_polls.public,
				user_polls.status, user_polls.votes, user_polls.created, 
				user_polls.updated, user_polls.user_restricted,
				user_polls.hash, user_polls.vote_type, user_polls.votes_today,
				user_polls.votes_today_timestamp, user_polls.votes_month,
				user_polls.votes_month_timestamp, user_polls.themeid,
				poll_themes.name as themename, poll_themes.css_code")
			->where("user_polls.ID", $id)
			->where("user_polls.userid", $userid)
			->join("poll_themes", "poll_themes.ID = user_polls.themeid", 
					"left outer")
			->join("users", "users.ID = user_polls.userid", "left outer")
			->get("user_polls");
	}

	public function get_user_polls($userid, $datatable) 
	{
		$datatable->db_order();

		$datatable->db_search(array(
			"user_polls.name"
			)
		);

		return $this->db
			->where("user_polls.userid", $userid)
			->where("status !=", 2)
			->limit($datatable->length, $datatable->start)
			->get("user_polls");
	}

	public function get_all_polls($datatable) 
	{
		$datatable->db_order();

		$datatable->db_search(array(
			"user_polls.name"
			)
		);

		return $this->db
			->where("status !=", 2)
			->where("public", 0)
			->limit($datatable->length, $datatable->start)
			->get("user_polls");
	}

	public function get_user_polls_archived($userid, $datatable) 
	{
		$datatable->db_order();

		$datatable->db_search(array(
			"user_polls.name"
			)
		);

		return $this->db
			->where("user_polls.userid", $userid)
			->where("status", 2)
			->limit($datatable->length, $datatable->start)
			->get("user_polls");
	}


	public function get_total_user_polls($userid) 
	{
		$s = $this->db
			->select("COUNT(*) as num")
			->where("userid", $userid)
			->get("user_polls");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function get_total_polls() 
	{
		$s = $this->db
			->where("public", 0)
			->select("COUNT(*) as num")
			->get("user_polls");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function get_total_poll_votes($userid) 
	{
		$s = $this->db
			->select("SUM(votes) as num")
			->where("userid", $userid)
			->get("user_polls");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function get_total_poll_votes_today($userid) 
	{
		$s = $this->db
			->select("COUNT(*) as num")
			->where("userid", $userid)
			->where("timestamp >", time() - (24*3600))
			->get("user_poll_votes");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function get_total_user_polls_archived($userid) 
	{
		$s = $this->db
			->select("COUNT(*) as num")
			->where("userid", $userid)
			->where("status", 2)
			->get("user_polls");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function update_poll($id, $data) 
	{
		$this->db->where("ID", $id)->update("user_polls", $data);
	}

	public function get_poll_answers($pollid) 
	{
		return $this->db->where("pollid", $pollid)->get("user_poll_answers");
	}

	public function add_answer($pollid, $answer) 
	{
		$this->db->insert("user_poll_answers", array(
			"pollid" => $pollid, 
			"answer" => $answer
			)
		);
		return $this->db->insert_id();
	}

	public function get_poll_answer($pollid, $answerid) 
	{
		return $this->db
			->where("ID", $answerid)
			->where("pollid", $pollid)
			->get("user_poll_answers");
	}

	public function update_answer($answerid, $data) {
		$this->db->where("ID", $answerid)->update("user_poll_answers", $data);
	}

	public function delete_answer($id) 
	{
		$this->db->where("ID", $id)->delete("user_poll_answers");
	}

	public function check_user_vote($pollid) 
	{
		return $this->db
			->where("pollid", $pollid)
			->where("IP", $_SERVER['REMOTE_ADDR'])
			->get("user_poll_votes");
	}

	public function get_poll_vote($pollid, $userid) 
	{
		return $this->db->where("pollid", $pollid)
			->where("userid", $userid)
			->get("user_poll_votes");
	}

	public function add_vote($data) 
	{
		$this->db->insert("user_poll_votes", $data);
	}

	public function get_country_vote($pollid, $country) 
	{
		return $this->db
			->where("pollid", $pollid)
			->where("country", $country)
			->get("user_poll_countries");
	}

	public function update_country_vote($id, $data) 
	{
		$this->db->where("ID", $id)->update("user_poll_countries", $data);
	}

	public function add_country_vote($data) 
	{
		$this->db->insert("user_poll_countries", $data);
	}

	public function get_recent_votes($pollid) 
	{
		return $this->db->where("user_poll_votes.pollid", $pollid)
			->select("user_poll_votes.IP, user_poll_votes.user_agent, 
				user_poll_votes.timestamp, user_poll_votes.ID, 
				user_poll_answers.answer")
			->join("user_poll_answers", "user_poll_answers.ID = 
				user_poll_votes.answerid")
			->limit(5)
			->order_by("user_poll_votes.ID", "DESC")
			->get("user_poll_votes");
	}

	public function top_country_votes($pollid) 
	{
		return $this->db
			->where("pollid", $pollid)
			->order_by("votes", "DESC")
			->limit(5)
			->get("user_poll_countries");
	}

	public function count_votes_date($date, $pollid) 
	{
		$s = $this->db
			->select("COUNT(*) as num")
			->where("date_stamp", $date)
			->where("pollid", $pollid)
			->get("user_poll_votes");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function get_votes($pollid, $page) 
	{
		return $this->db->where("user_poll_votes.pollid", $pollid)
			->select("user_poll_votes.IP, user_poll_votes.user_agent, 
				user_poll_votes.timestamp, user_poll_votes.ID, 
				user_poll_answers.answer")
			->join("user_poll_answers", "user_poll_answers.ID = 
				user_poll_votes.answerid")
			->limit($page, 20)
			->order_by("user_poll_votes.ID", "DESC")
			->get("user_poll_votes");
	}

	public function get_total_votes_count($pollid) 
	{
		$s = $this->db
			->select("COUNT(*) as num")
			->where("pollid", $pollid)
			->get("user_poll_votes");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function update_all_poll_answers($id, $data) 
	{
		$this->db->where("pollid", $id)->update("user_poll_answers", $data);
	}

	public function delete_poll_votes($pollid) 
	{
		$this->db->where("pollid", $pollid)->delete("user_poll_votes");
	}

	public function delete_poll_countries($pollid) 
	{
		$this->db->where("pollid", $pollid)->delete("user_poll_countries");
	}

	public function get_poll_themes() 
	{
		return $this->db->get("poll_themes");
	}

	public function get_poll_theme($id) 
	{
		return $this->db->where("ID", $id)->get("poll_themes");
	}

	public function add_poll_theme($data) 
	{
		$this->db->insert("poll_themes", $data);
	}

	public function delete_theme($id) 
	{
		$this->db->where("ID", $id)->delete("poll_themes");
	}

	public function update_poll_theme($id, $data) 
	{
		$this->db->where("ID", $id)->update("poll_themes", $data);
	}

	public function delete_poll($id) 
	{
		$this->db->where("ID", $id)->delete("user_polls");
	}

	public function count_user_votes_date($date, $userid) 
	{
		$s = $this->db
			->select("COUNT(*) as num")
			->where("date_stamp", $date)
			->where("userid", $userid)
			->get("user_poll_votes");
		$r = $s->row();
		if(isset($r->num)) return $r->num;
		return 0;
	}

	public function get_user_recent_polls($userid) 
	{
		return $this->db->where("userid", $userid)->limit(5)
			->order_by("ID", "DESC")->get("user_polls");
	}

}

?>