// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.MapContainer

package com.qeedoo.ui.view.compGameStage
{
    import flash.display.Sprite;
    import com.qeedoo.ui.resource.local.CacheLoader;
    import com.qeedoo.ui.view.compMain.LoaderCanvas;
    import com.qeedoo.ui.resource.Loader10;
    import com.qeedoo.game.system.Core;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.qeedoo.MMOGame;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.ProgressEvent;
    import flash.display.DisplayObject;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.HTTPStatusEvent;
    import com.qeedoo.game.config.Language;
    import flash.net.URLRequest;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.UIComponent;
    import com.qeedoo.ui.resource.local.LocalStorage;
    import com.qeedoo.game.event.GameDataEvent;

    public class MapContainer extends Sprite 
    {

        private var _freeLoaderList:Array;
        private var _cellWidth:int = 100;
        private var _cellData:Object;
        private var _cellTable:Array;
        private var _initialized:Boolean = false;
        private var _type:int;
        private var _mapRoot:String;
        private var _showModel:Boolean = true;
        private var _singleLoaderLocal:CacheLoader;
        private var _height:int;
        private var _width:int;
        private var _cellHeight:int = 100;
        private var _parent:StageMain;
        private var _totalCount:int = 0;
        private var _loadedCount:int = 0;
        private var _loadingInfo:LoaderCanvas;
        private var _stateTable:Array;
        private var _singleLoader:Loader10;
        private var _oldX:int = -1;
        private var _oldY:int = -1;
        private var _core:Core = Core.getInstance();

        public function MapContainer()
        {
            cacheAsBitmap = true;
            _freeLoaderList = [];
            clear();
        }

        private function set loadedNum(_arg_1:int):void
        {
            _loadedCount = _arg_1;
            if (_loadingInfo)
            {
                _loadingInfo.setProgress(_loadedCount, _totalCount);
            };
            checkFinish();
        }

        private function removeCell(p_indexX:int, p_indexY:int):void
        {
            if (((_stateTable[p_indexX]) && (_stateTable[p_indexX][p_indexY] == 2)))
            {
                _stateTable[p_indexX][p_indexY] = 1;
                try
                {
                    removeChild(_cellTable[p_indexX][p_indexY]);
                }
                catch(e:Object)
                {
                    trace(" the cell is not in display list ");
                };
            };
        }

        private function getLoader():Loader
        {
            var _local_1:Loader;
            if (_freeLoaderList.length > 0)
            {
                _local_1 = _freeLoaderList.pop();
                _local_1.x = 0;
                _local_1.y = 0;
            }
            else
            {
                _local_1 = new Loader();
                _local_1.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
                _local_1.addEventListener(IOErrorEvent.IO_ERROR, errHandler);
            };
            return (_local_1);
        }

        private function get iX():int
        {
            var _local_1:int = int(int(((-(_parent.x) - (stage.stageWidth / 2)) / 100)));
            var _local_2:int = (iW - (iSW * 2));
            if (_local_1 > _local_2)
            {
                _local_1 = _local_2;
            };
            if (_local_1 < 0)
            {
                _local_1 = 0;
            };
            return (_local_1);
        }

        public function init(_arg_1:StageMain, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int=0, _arg_6:Object=null, _arg_7:Boolean=true):void
        {
            clear();
            _parent = _arg_1;
            _mapRoot = _arg_2;
            _type = _arg_5;
            _width = _arg_3;
            _height = _arg_4;
            _showModel = _arg_7;
            _loadingInfo = MMOGame.loader;
            _cellData = [];
            switch (_type)
            {
                case GamePredef.MAP_TYPE_NORMAL:
                    _cellWidth = 100;
                    _cellHeight = 100;
                    loadCurrentArea();
                    return;
                case GamePredef.MAP_TYPE_TILE:
                    _cellWidth = 200;
                    _cellHeight = 100;
                    _cellData = _arg_6;
                    loadAllTile();
                    return;
                case GamePredef.MAP_TYPE_SINGLE:
                    singleMap();
                    return;
            };
        }

        private function loadSingleHandler(_arg_1:ProgressEvent):void
        {
            _loadingInfo.setProgress(_arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        private function loadFinish():void
        {
            _loadingInfo.hide();
            _parent.loadFinish();
        }

        private function get totalNum():int
        {
            return (_totalCount);
        }

        private function addCell(_arg_1:int, _arg_2:int):void
        {
            var _local_3:DisplayObject = DisplayObject(_cellTable[_arg_1][_arg_2]);
            if (_stateTable[_arg_1] == null)
            {
                _stateTable[_arg_1] = [];
            };
            if (_stateTable[_arg_1][_arg_2] == null)
            {
                switch (_type)
                {
                    case GamePredef.MAP_TYPE_NORMAL:
                        _local_3.x = (_arg_1 * _cellWidth);
                        _local_3.y = (_arg_2 * _cellHeight);
                        break;
                    case GamePredef.MAP_TYPE_TILE:
                        if ((_arg_2 % 2) == 0)
                        {
                            _local_3.x = ((_arg_1 * _cellWidth) - (_cellWidth / 2));
                        }
                        else
                        {
                            _local_3.x = (_arg_1 * _cellWidth);
                        };
                        _local_3.y = ((_arg_2 * _cellHeight) / 2);
                        break;
                    case GamePredef.MAP_TYPE_SINGLE:
                        _local_3.x = 0;
                        _local_3.y = 0;
                        break;
                };
            };
            if (_stateTable[_arg_1][_arg_2] != 2)
            {
                _stateTable[_arg_1][_arg_2] = 2;
                addChild(_local_3);
            };
        }

        private function genPath(_arg_1:int, _arg_2:int):String
        {
            if (_cellData.length <= 0)
            {
                return (((((_mapRoot + "/MAP_") + _arg_1) + "_") + _arg_2) + ".jpg");
            };
            if (((_cellData[_arg_1]) && (_cellData[_arg_1][_arg_2])))
            {
                return (ResManager.getResUrl(_cellData[_arg_1][_arg_2]));
            };
            return (null);
        }

        private function get iW():int
        {
            return (int((width / _cellWidth)));
        }

        private function get iY():int
        {
            var _local_1:int = int(int(((-(_parent.y) - (stage.stageHeight / 2)) / 100)));
            var _local_2:int = (iH - (iSH * 2));
            if (_local_1 > _local_2)
            {
                _local_1 = _local_2;
            };
            if (_local_1 < 0)
            {
                _local_1 = 0;
            };
            return (_local_1);
        }

        public function loadAllTile():void
        {
            var _local_1:Object;
            var _local_2:Object;
            totalNum = 0;
            loadedNum = 0;
            for (_local_1 in _cellData)
            {
                for (_local_2 in _cellData[_local_1])
                {
                    loadCell(Number(_local_1), Number(_local_2));
                };
            };
            markLoaded(0, 0);
        }

        private function get iSH():int
        {
            return (int((stage.stageHeight / _cellHeight)));
        }

        private function errHandler(_arg_1:IOErrorEvent):void
        {
            loadedNum++;
        }

        private function get iSW():int
        {
            return (int((stage.stageWidth / _cellWidth)));
        }

        private function onComplete(_arg_1:Loader):void
        {
            addChild(_arg_1);
            loadFinish();
        }

        public function loadSpecialMaps(_arg_1:StageMain, _arg_2:Number):void
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_MAP][_arg_2];
            if (_local_3)
            {
                _parent = _arg_1;
                _mapRoot = ResManager.getResUrlNoHash(_local_3.resCode);
                _width = _local_3.width;
                _height = _local_3.height;
                _type = _local_3.type;
                _loadingInfo = MMOGame.loader;
                if (((_arg_1) && (_arg_1.mapContainer)))
                {
                    _local_4 = genPath(0, 0);
                    _singleLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadSingleHandler);
                    _singleLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadSpecialComplete);
                    _singleLoader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
                    _singleLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
                    _loadingInfo.showModel(MMOGame.app, Language.MAPCONTAINER_S[0], GamePredef.SYSTEM_TIP[1][int((Math.random() * GamePredef.SYSTEM_TIP[1].length))]);
                    _singleLoader.load(new URLRequest(ResManager.hash(_local_4)));
                    _local_5 = _core.view.getUI(ViewManager.POPU_WAIT);
                    if (_local_5.parent == MMOGame.app)
                    {
                        MMOGame.app.setChildIndex((_local_5 as UIComponent), (MMOGame.app.numChildren - 1));
                    }
                    else
                    {
                        MMOGame.app.addChild((_local_5 as UIComponent));
                    };
                };
            };
        }

        private function loadSingleCompleteHandler(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(ProgressEvent.PROGRESS, loadSingleHandler);
            _arg_1.currentTarget.removeEventListener(Event.COMPLETE, loadSingleCompleteHandler);
            _arg_1.currentTarget.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            _arg_1.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            addChild(_singleLoader);
            loadFinish();
        }

        public function set mapRoot(_arg_1:String):void
        {
            _mapRoot = _arg_1;
        }

        private function loadSingleLocal(url:String):void
        {
            var func:Function;
            if (_showModel)
            {
                LocalStorage.getInstance().checkLocalStorageSetting();
                _singleLoaderLocal = CacheLoader.getLoader(url, onComplete);
                _singleLoaderLocal.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadSingleHandler);
                _loadingInfo.showModel(MMOGame.app, Language.MAPCONTAINER_S[0], GamePredef.SYSTEM_TIP[1][int((Math.random() * GamePredef.SYSTEM_TIP[1].length))]);
            }
            else
            {
                func = function (_arg_1:*):void
                {
                };
                _singleLoaderLocal = CacheLoader.getLoader(url, func);
            };
        }

        private function markLoaded(_arg_1:int, _arg_2:int):void
        {
            _oldX = _arg_1;
            _oldY = _arg_2;
        }

        private function checkFinish():void
        {
            if (_loadedCount < _totalCount)
            {
                return;
            };
            loadFinish();
        }

        private function loadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:Loader = Loader(_arg_1.currentTarget.loader);
            addCellContent(_local_2);
        }

        private function loadSpecialComplete(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(ProgressEvent.PROGRESS, loadSingleHandler);
            _arg_1.currentTarget.removeEventListener(Event.COMPLETE, loadSpecialComplete);
            _arg_1.currentTarget.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            _arg_1.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            _parent.dispatchEvent(new Event(GameDataEvent.MAP_READY));
        }

        public function clear():void
        {
            while (numChildren > 0)
            {
                removeChildAt(0);
            };
            _stateTable = [];
            _cellTable = [];
            _width = 1;
            _height = 1;
            if (_singleLoader)
            {
                _singleLoader.unloadAndGC();
            }
            else
            {
                _singleLoader = new Loader10();
            };
            _initialized = false;
        }

        private function loadSingle(_arg_1:Loader, _arg_2:String):void
        {
            if (_showModel)
            {
                _arg_1.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadSingleHandler);
                _arg_1.contentLoaderInfo.addEventListener(Event.COMPLETE, loadSingleCompleteHandler);
                _arg_1.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
                _arg_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
                _loadingInfo.showModel(MMOGame.app, Language.MAPCONTAINER_S[0], GamePredef.SYSTEM_TIP[1][int((Math.random() * GamePredef.SYSTEM_TIP[1].length))]);
            };
            _arg_1.load(new URLRequest(ResManager.hash(_arg_2)));
        }

        private function httpStatusHandler(_arg_1:HTTPStatusEvent):void
        {
            if (_arg_1.status >= 300)
            {
                _core.sysMsg(("Load Map Status:" + _arg_1.status));
                singleMap();
            };
        }

        private function set totalNum(_arg_1:int):void
        {
            _totalCount = _arg_1;
        }

        public function get mheight():int
        {
            return (_height);
        }

        private function addCellContent(_arg_1:Loader):void
        {
            var _local_2:DisplayObject = _arg_1.content;
            _local_2.width = _cellWidth;
            _local_2.height = _cellHeight;
            _arg_1.unload();
            _cellTable[_arg_1.x][_arg_1.y] = _local_2;
            addCell(_arg_1.x, _arg_1.y);
            _freeLoaderList.push(_arg_1);
            loadedNum++;
        }

        private function get loadedNum():int
        {
            return (_loadedCount);
        }

        public function loadCurrentArea():void
        {
            var _local_6:int;
            totalNum = 0;
            loadedNum = 0;
            var _local_1:int = iX;
            var _local_2:int = iY;
            var _local_3:int = (_local_1 + (iSW * 2));
            var _local_4:int = (_local_2 + (iSH * 2));
            var _local_5:int = _local_1;
            while (_local_5 < _local_3)
            {
                _local_6 = _local_2;
                while (_local_6 < _local_4)
                {
                    loadCell(_local_5, _local_6);
                    _local_6++;
                };
                _local_5++;
            };
            markLoaded(_local_1, _local_2);
        }

        private function loadCell(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Loader;
            var _local_4:String;
            if (!_cellTable[_arg_1])
            {
                _cellTable[_arg_1] = [];
            };
            if (_cellTable[_arg_1][_arg_2])
            {
                addCell(_arg_1, _arg_2);
            }
            else
            {
                _local_3 = getLoader();
                _local_4 = genPath(_arg_1, _arg_2);
                loadMulti(_local_3, _local_4, _arg_1, _arg_2);
            };
        }

        private function ioErrorHandler(_arg_1:IOErrorEvent):void
        {
            _cellWidth = _width;
            _cellHeight = _height;
            var _local_2:String = genPath(0, 0);
            _local_2 = (_local_2 + ("?" + Math.random()));
            loadSingle(_singleLoader, _local_2);
        }

        private function loadMulti(_arg_1:Loader, _arg_2:String, _arg_3:int, _arg_4:int):void
        {
            _arg_1.load(new URLRequest(_arg_2));
            _arg_1.x = _arg_3;
            _arg_1.y = _arg_4;
            totalNum++;
        }

        private function singleMap():void
        {
            _cellWidth = _width;
            _cellHeight = _height;
            var _local_1:String = genPath(0, 0);
            loadSingle(_singleLoader, _local_1);
        }

        public function get mwidth():int
        {
            return (_width);
        }

        private function get iH():int
        {
            return (int((height / _cellHeight)));
        }


    }
}//package com.qeedoo.ui.view.compGameStage

