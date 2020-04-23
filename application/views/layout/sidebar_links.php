<ul class="newnav nav nav-sidebar">
           <?php if($this->user->loggedin && isset($this->user->info->user_role_id) && 
           ($this->user->info->admin || $this->user->info->admin_settings || $this->user->info->admin_members || $this->user->info->admin_payment)

           ) : ?>
              <li id="admin_sb">
                <a data-toggle="collapse" data-parent="#admin_sb" href="#admin_sb_c" class="collapsed <?php if(isset($activeLink['admin'])) echo "active" ?>" >
                  <span class="glyphicon glyphicon-wrench sidebar-icon sidebar-icon-red"></span> <?php echo lang("ctn_157") ?>
                  <span class="plus-sidebar"><span class="glyphicon <?php if(isset($activeLink['admin'])) : ?>glyphicon-menu-down<?php else : ?>glyphicon-menu-right<?php endif; ?>"></span></span>
                </a>
                <div id="admin_sb_c" class="panel-collapse collapse sidebar-links-inner <?php if(isset($activeLink['admin'])) echo "in" ?>">
                  <ul class="inner-sidebar-links">
                    <?php if($this->user->info->admin || $this->user->info->admin_settings) : ?>
                      <li class="<?php if(isset($activeLink['admin']['settings'])) echo "active" ?>"><a href="<?php echo site_url("admin/settings") ?>"> <?php echo lang("ctn_158") ?></a></li>
                      <li class="<?php if(isset($activeLink['admin']['social_settings'])) echo "active" ?>"><a href="<?php echo site_url("admin/social_settings") ?>"> <?php echo lang("ctn_159") ?></a></li>
                    <?php endif; ?>
                    <?php if($this->user->info->admin || $this->user->info->admin_members) : ?>
                    <li class="<?php if(isset($activeLink['admin']['members'])) echo "active" ?>"><a href="<?php echo site_url("admin/members") ?>"> <?php echo lang("ctn_160") ?></a></li>
                    <?php endif; ?>
                    <?php if($this->user->info->admin) : ?>
                    <li class="<?php if(isset($activeLink['admin']['user_roles'])) echo "active" ?>"><a href="<?php echo site_url("admin/user_roles") ?>"> <?php echo lang("ctn_470") ?></a></li>
                    <?php endif; ?>
                    <?php if($this->user->info->admin || $this->user->info->admin_members) : ?>
                    <li class="<?php if(isset($activeLink['admin']['user_groups'])) echo "active" ?>"><a href="<?php echo site_url("admin/user_groups") ?>"> <?php echo lang("ctn_161") ?></a></li>
                    <li class="<?php if(isset($activeLink['admin']['ipblock'])) echo "active" ?>"><a href="<?php echo site_url("admin/ipblock") ?>"> <?php echo lang("ctn_162") ?></a></li>
                    <?php endif; ?>
                    <?php if($this->user->info->admin) : ?>
                      <li class="<?php if(isset($activeLink['admin']['email_templates'])) echo "active" ?>"><a href="<?php echo site_url("admin/email_templates") ?>"> <?php echo lang("ctn_163") ?></a></li>
                    <?php endif; ?>
                    <?php if($this->user->info->admin || $this->user->info->admin_members) : ?>
                      <li class="<?php if(isset($activeLink['admin']['email_members'])) echo "active" ?>"><a href="<?php echo site_url("admin/email_members") ?>"> <?php echo lang("ctn_164") ?></a></li>
                    <?php endif; ?>
                    <?php if($this->user->info->admin || $this->user->info->admin_payment) : ?>
                    <li class="<?php if(isset($activeLink['admin']['payment_settings'])) echo "active" ?>"><a href="<?php echo site_url("admin/payment_settings") ?>"> <?php echo lang("ctn_246") ?></a></li>
                    <li class="<?php if(isset($activeLink['admin']['payment_plans'])) echo "active" ?>"><a href="<?php echo site_url("admin/payment_plans") ?>"> <?php echo lang("ctn_258") ?></a></li>
                    <li class="<?php if(isset($activeLink['admin']['payment_logs'])) echo "active" ?>"><a href="<?php echo site_url("admin/payment_logs") ?>"> <?php echo lang("ctn_288") ?></a></li>
                    <li class="<?php if(isset($activeLink['admin']['premium_users'])) echo "active" ?>"><a href="<?php echo site_url("admin/premium_users") ?>"> <?php echo lang("ctn_325") ?></a></li>
                    <?php endif; ?>
                  </ul>
                </div>
              </li>
              <?php if($this->common->has_permissions(array("admin", "admin_poll"), $this->user)) : ?>
                <li id="admin_sb_poll">
                <a data-toggle="collapse" data-parent="#admin_sb_poll" href="#admin_sb_c_poll" class="collapsed <?php if(isset($activeLink['admin_poll'])) echo "active" ?>" >
                  <span class="glyphicon glyphicon-wrench sidebar-icon sidebar-icon-red"></span> <?php echo lang("ctn_296") ?>
                  <span class="plus-sidebar"><span class="glyphicon <?php if(isset($activeLink['admin_poll'])) : ?>glyphicon-menu-down<?php else : ?>glyphicon-menu-right<?php endif; ?>"></span></span>
                </a>
                <div id="admin_sb_c_poll" class="panel-collapse collapse sidebar-links-inner <?php if(isset($activeLink['admin_poll'])) echo "in" ?>">
                  <ul class="inner-sidebar-links">
                    <li class="<?php if(isset($activeLink['admin_poll']['poll_settings'])) echo "active" ?>"><a href="<?php echo site_url("admin/poll_settings") ?>"> <?php echo lang("ctn_297") ?></a></li>
                    <li class="<?php if(isset($activeLink['admin_poll']['manage'])) echo "active" ?>"><a href="<?php echo site_url("admin/manage_polls") ?>"> <?php echo lang("ctn_298") ?></a></li>
                    <li class="<?php if(isset($activeLink['admin_poll']['poll_themes'])) echo "active" ?>"><a href="<?php echo site_url("admin/poll_themes") ?>"> <?php echo lang("ctn_299") ?></a></li>
                  </ul>
                </div>
              </li>
            <?php endif; ?>
            <?php endif; ?>
            <li class="<?php if(isset($activeLink['home']['general'])) echo "active" ?>"><a href="<?php echo site_url() ?>"><span class="glyphicon glyphicon-home sidebar-icon sidebar-icon-orange"></span> <?php echo lang("ctn_154") ?> <span class="sr-only">(current)</span></a></li>
            <li class="<?php if(isset($activeLink['poll']['active'])) echo "active" ?>"><a href="<?php echo site_url("polls/all") ?>"><span class="glyphicon glyphicon-stats sidebar-icon sidebar-icon-brown"></span> <?php echo lang("ctn_494") ?></a></li>
            <?php if($this->common->has_permissions(array("admin", "poll_creator"), $this->user)) : ?>
            <li class="<?php if(isset($activeLink['poll']['active'])) echo "active" ?>"><a href="<?php echo site_url("polls") ?>"><span class="glyphicon glyphicon-stats sidebar-icon"></span> <?php echo lang("ctn_301") ?></a></li>
            <li class="<?php if(isset($activeLink['poll']['archived'])) echo "active" ?>"><a href="<?php echo site_url("polls/archived") ?>"><span class="glyphicon glyphicon-tasks sidebar-icon"></span> <?php echo lang("ctn_302") ?></a></li>
          <?php endif; ?>

            <li class="<?php if(isset($activeLink['members']['general'])) echo "active" ?>"><a href="<?php echo site_url("members") ?>"><span class="glyphicon glyphicon-user sidebar-icon sidebar-icon-green"></span> <?php echo lang("ctn_155") ?></a></li>
            <li class="<?php if(isset($activeLink['settings']['general'])) echo "active" ?>"><a href="<?php echo site_url("user_settings") ?>"><span class="glyphicon glyphicon-cog sidebar-icon sidebar-icon-grey"></span> <?php echo lang("ctn_156") ?></a></li>
          <?php if($this->settings->info->payment_enabled) : ?>
            <li class="<?php if(isset($activeLink['funds']['general'])) echo "active" ?>"><a href="<?php echo site_url("funds") ?>"><span class="glyphicon glyphicon-piggy-bank sidebar-icon sidebar-icon-pink"></span> <?php echo lang("ctn_245") ?></a></li>
            <li class="<?php if(isset($activeLink['funds']['plans'])) echo "active" ?>"><a href="<?php echo site_url("funds/plans") ?>"><span class="glyphicon glyphicon-list-alt sidebar-icon sidebar-icon-brown"></span> <?php echo lang("ctn_273") ?></a></li>
          <?php endif; ?>
          
          </ul>