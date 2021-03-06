{*
TestLink Open Source Project - http://testlink.sourceforge.net/
@filesource	platformsEdit.tpl
Purpose: smarty template - View all platforms

@internal revisions
20110409 - franciscom - BUGID 4368: Provide WYSIWYG Editor for platform notes
*}
{$url_args="lib/platforms/platformsEdit.php"}
{$platform_edit_url="$basehref$url_args"}

{lang_get var="labels"
          s="warning,warning_empty_platform,show_event_history,
             th_platform,th_notes,btn_cancel"}


{include file="inc_head.tpl" jsValidate="yes" openHead="yes"}
{include file="inc_ext_js.tpl"}


<script type="text/javascript">
var alert_box_title = "{$labels.warning|escape:'javascript'}";
var warning_empty_platform = "{$labels.warning_empty_platform|escape:'javascript'}";

function validateForm(f)
{
	if (isWhitespace(f.name.value))
  	{
    	alert_message(alert_box_title,warning_empty_platform);
      	selectField(f, 'name');
      	return false;
  	}
	return true;
}
</script>
</head>

<body>
{$cfg_section=$smarty.template|basename|replace:".tpl":""}
{config_load file="input_dimensions.conf" section=$cfg_section}

<h1 class="title">{$gui->action_descr|escape}</h1>

{include file="inc_feedback.tpl" user_feedback=$gui->user_feedback}

{if $gui->canManage != ""}
  <div class="workBack">
  
  <div>
	{if $gui->mgt_view_events eq "yes" && $gui->platformID > 0}
			<img style="margin-left:5px;" class="clickable" 
			     src="{$smarty.const.TL_THEME_IMG_DIR}/question.gif" 
			     onclick="showEventHistoryFor('{$gui->platformID}','platforms')" 
			     alt="{$labels.show_event_history}" title="{$labels.show_event_history}"/>
	{/if}
  
  </div><br />

  	<form id="addPlatform" name="addPlatform" method="post" action="{$platform_edit_url}"
 		      onsubmit="javascript:return validateForm(this);">

  	<table class="common" style="width:50%">
  		<tr>
  			<th>{$labels.th_platform}</th>
  			{assign var="input_name" value="name"}
  			<td><input type="text" name="{$input_name}"
  			           size="{#PLATFORM_SIZE#}" maxlength="{#PLATFORM_MAXLEN#}"
  				         value="{$gui->name|escape}" />
			  		{include file="error_icon.tpl" field="$input_name"}
			  </td>
  		</tr>
  		<tr>
  			<th>{$labels.th_notes}</th>
  			<td>{$gui->notes}</td>
  		</tr>
  	</table>
  	<div class="groupBtn">	
	  	<input type="hidden" name="doAction" value="" />
	  	<input type="hidden" name="tproject_id" id="tproject_id" value="{$gui->tproject_id}" />
	    <input type="submit" id="submitButton" name="submitButton" value="{$gui->submit_button_label}"
		         onclick="doAction.value='{$gui->submit_button_action}'" />
	  	<input type="button" value="{$labels.btn_cancel}"
		         onclick="javascript:location.href=fRoot+'lib/platforms/platformsView.php?tproject_id={$gui->tproject_id}'" />
  	</div>
  	</form>
  </div>
{/if}
{* --------------------------------------------------------------------------------------   *}

</body>
</html>
