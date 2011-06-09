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

package org.spicefactory.lib.command.builder {

import org.spicefactory.lib.command.util.DelayCommand;
import org.spicefactory.lib.command.util.DelegateCommand;
	
/**
 * @author Jens Halm
 */
public class Commands {
	
	
	public static function wrap (command:Object) : CommandProxyBuilder {
		return new CommandProxyBuilder(command);
	}
	
	public static function create (commandType:Class) : CommandProxyBuilder {
		// TODO - use adpater factory if type does not implement Command
		return new CommandProxyBuilder(new DefaultCommandFactory(commandType));
	}
	
	public static function delegate (commandFunction:Function, ...params) : CommandProxyBuilder {
		return new CommandProxyBuilder(new DelegateCommand(commandFunction, params));
	}
	
	public static function delay (milliseconds:uint) : CommandProxyBuilder {
		return new CommandProxyBuilder(new DelayCommand(milliseconds));
	}
	
	public static function asSequence () : CommandGroupBuilder {
		return new CommandGroupBuilder(true);
	}
	
	public static function inParallel () : CommandGroupBuilder {
		return new CommandGroupBuilder(false);
	}
	
	public static function asFlow () : CommandFlowBuilder {
		return new CommandFlowBuilder();
	}
	
	
}
}
