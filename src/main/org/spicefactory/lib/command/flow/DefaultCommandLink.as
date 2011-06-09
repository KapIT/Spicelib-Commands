/*
 * Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.spicefactory.lib.command.flow {

import org.spicefactory.lib.command.CommandResult;
import org.spicefactory.lib.command.CommandLinkProcessor;
import org.spicefactory.lib.command.CommandLink;
	
/**
 * @author Jens Halm
 */
public class DefaultCommandLink implements CommandLink {


	private var condition:LinkCondition;
	private var action:LinkAction;
	
	
	public function DefaultCommandLink (condition:LinkCondition, action:LinkAction) {
		this.condition = condition;
		this.action = action;
	}
	

	public function link (result:CommandResult, processor:CommandLinkProcessor) : void {
		if (condition.matches(result)) {
			action.execute(processor);
		}
	}
	
	
}
}