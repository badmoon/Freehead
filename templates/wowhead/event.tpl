{include file='header.tpl'}

		<div id="main">

			<div id="main-precontents"></div>
			<div id="main-contents" class="main-contents">

				<script type="text/javascript">
					{include file='bricks/allcomments.tpl'}
					{include file='bricks/allscreenshots.tpl'}
					var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$event.name|escape:"quotes"}'{rdelim};
					g_initPath({$page.path});
				</script>

				<table class="infobox">
					<tr><th>{#Quick_Facts#}</th></tr>
					<tr><td>
						<div class="infobox-spacer"></div>
						<ul>
							<li><div>{#Start#}: {$event.starttime}</div></li>
							<li><div>{#End#}: {$event.endtime}</div></li>
						</ul>
					</td></tr>
				</table>

				<div class="text">
					{if $event.holiday>0}
						<a href="http://www.wowhead.com/?event={$event.holiday}" class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>
					{/if}
					<h1><img src="/images/events/{$event.name|escape:"html"}.png" width="5%">{$event.name|escape:"html"}</h1>
					
					<table width="76%">
					<tr>
					<td width="35%">{$event.exdesc}</td>
					<td width="41%"><img src="/images/events/{$event.exdescimg}"></td>
					</tr>
					</table>

					<h2>{#Related#}</h2>
				</div>

				<div id="tabs-generic"></div>
				<div id="listview-generic" class="listview"></div>
<script type="text/javascript">
var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
{if isset($event.npcs)}{include file='bricks/creature_table.tpl' id='npcs' tabsid='tabsRelated' data=$event.npcs name='npcs' }{/if}
{if isset($event.objects)}{include file='bricks/object_table.tpl' id='objects' tabsid='tabsRelated' data=$event.objects name='objects' }{/if}
{if isset($event.quests)}{include file='bricks/quest_table.tpl' id='quests' tabsid='tabsRelated' data=$event.quests name='quests' }{/if}
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: lv_comments{rdelim});
new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});
tabsRelated.flush();
</script>

				{include file='bricks/contribute.tpl'}
			</div>
		</div>

{include file='footer.tpl'}