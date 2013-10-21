package com.huntcoding;

import java.io.FileDescriptor;
import java.net.InetAddress;

public class HCSecurityManager extends SecurityManager {
	private Object secret;
	public HCSecurityManager(Object pass) {
		super();
		this.secret = pass;
	}
	public void disable(Object pass) {
		if (pass == secret) {
			secret = null;
		}
	}
	//.. override checkXXX
	@Override
	public void checkAccept(String host, int port) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkAccess(Thread t) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkAccess(ThreadGroup g) {
		if(secret != null){
			throw new SecurityException();
		}
	}

	
	@Override
	public void checkConnect(String host, int port) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkConnect(String host, int port, Object context) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkDelete(String file) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkExec(String cmd) {
		System.out.println("Exec");
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkExit(int status) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkLink(String lib) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkListen(int port) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkMulticast(InetAddress maddr) {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkPrintJobAccess() {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkPropertiesAccess() {
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkPropertyAccess(String key){
		if(key.equals("line.separator")){
			return;
		}
		if(secret != null){
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkRead(FileDescriptor fd){
		throw new SecurityException();
	}
	
	
	@Override
	public void checkRead(String file) {
		if(secret != null) {
			if(file.endsWith(".class")) {
				return;
			}
			throw new SecurityException();
		}
	}
	
	@Override
	public void checkRead(String file, Object context) {
		throw new SecurityException();
	}
	
	@Override
	public void checkSecurityAccess(String target) {
		throw new SecurityException();
	}
	
	@Override
	public void checkSetFactory() {
		throw new SecurityException();
	}
	
	@Override
	public void checkSystemClipboardAccess() {
		throw new SecurityException();
	}
	
	@Override
	public boolean checkTopLevelWindow(Object window) {
		return false;
	}
	
	@Override
	public void checkWrite(FileDescriptor fd) {
		throw new SecurityException();
	}
	
	@Override
	public void checkWrite(String file) {
		throw new SecurityException();
	}
	
	

}
