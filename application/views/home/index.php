<div class="white-area-content">
<div class="row">

<div class="col-md-3">
<div class="dashboard-window clearfix" style="background: #62acec; border-left: 5px solid #5798d1;">
	<div class="d-w-icon">
		<span class="glyphicon glyphicon-send giant-white-icon"></span>
	</div>
	<div class="d-w-text">
		 <span class="d-w-num"><?php echo number_format($stats->polls) ?></span><br /><?php echo lang("ctn_351") ?>
	</div>
</div>
</div>

<div class="col-md-3">
<div class="dashboard-window clearfix" style="background: #5cb85c; border-left: 5px solid #4f9f4f;">
	<div class="d-w-icon">
		<span class="glyphicon glyphicon-wrench giant-white-icon"></span>
	</div>
	<div class="d-w-text">
		 <span class="d-w-num"><?php echo number_format($stats->poll_votes) ?></span><br /><?php echo lang("ctn_352") ?>
	</div>
</div>
</div>

<div class="col-md-3">
<div class="dashboard-window clearfix" style="background: #f0ad4e; border-left: 5px solid #d89b45;">
	<div class="d-w-icon">
		<span class="glyphicon glyphicon-folder-close giant-white-icon"></span>
	</div>
	<div class="d-w-text">
		 <span class="d-w-num"><?php echo number_format($stats->poll_votes_today) ?></span><br /><?php echo lang("ctn_353") ?>
	</div>
</div>
</div>

<div class="col-md-3">
<div class="dashboard-window clearfix" style="background: #d9534f; border-left: 5px solid #b94643;">
	<div class="d-w-icon">
		<span class="glyphicon glyphicon-user giant-white-icon"></span>
	</div>
	<div class="d-w-text">
		 <span class="d-w-num"><?php echo number_format($time['days']) ?></span><br /><?php echo lang("ctn_354") ?>
	</div>
</div>
</div>

</div>

<hr>

<div class="row">
<div class="col-md-8">

<div class="panel panel-default">
<div class="panel-body">
<h4 class="home-label"><?php echo lang("ctn_355") ?></h4>
<canvas id="myChart" class="graph-height"></canvas>
</div>
</div>

</div>
<div class="col-md-4">

<div class="panel panel-default">
<div class="panel-body">
<h4 class="home-label"><?php echo lang("ctn_356") ?></h4>

<table class="table table-bordered small-text">
<tr class="table-header"><td><?php echo lang("ctn_357") ?></td><td style="min-width: 150px;"><?php echo lang("ctn_52") ?></td></tr>
<?php foreach($polls->result() as $r) : ?>
<tr><td><?php echo $r->name ?></td><td><a href="<?php echo site_url("polls/view_poll/" . $r->ID . "/" . $r->hash) ?>" class="btn btn-primary btn-xs"><?php echo lang("ctn_335") ?></a> <a href="<?php echo site_url("polls/edit_poll/" . $r->ID) ?>"  class="btn btn-warning btn-xs"><?php echo lang("ctn_358") ?></a></td></tr>
<?php endforeach; ?>
</table>

</div>
</div>

<div class="panel panel-default">
<div class="panel-body small-text">
<h4 class="home-label">Welcome</h4>

<p><?php echo lang("ctn_433") ?>: <b><?php echo date($this->settings->info->date_format, $this->user->info->online_timestamp) ?></b></p>
<?php if($plan->num_rows() > 0) : ?>
	<?php $plan = $plan->row(); ?>
<p><?php echo lang("ctn_312") ?>: <b><?php echo $plan->name ?></b></p>
<p><?php echo lang("ctn_432") ?>: <b><?php echo $this->common->get_time_string($time) ?></b></p>
<?php endif; ?>

</div>
</div>


</div>
</div>
</div>